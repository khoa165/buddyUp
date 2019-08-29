class ConnectionsController < ApplicationController
  def search
    unless current_user.in_session?
      # Fetch user with valid/map-searchable address.
      users = User.geocoded
      query = params[:location]
      if query.present?
        current_user.update(search_term: query)
        users = User.near(query, 20)
      else
        current_user.update(search_term: current_user.address)
        users = User.near([current_user.latitude, current_user.longitude], 20)
      end
      # Remove current user.
      users = users.select { |user| user != current_user}
      @matches = retrieve_buddies(users)
      @connections = create_connections(@matches)
      current_user.begin_session!
    end
    redirect_to connections_path(location: params[:location])
  end

  def update
    @connection = Connection.find(params[:id])
    if current_user == @connection.sender
      @connection.update(status_sender: "buddy_requested")
      if @connection.status_receiver == "buddy_requested"
        @connection.update(status: "buddied")
      else
        @connection.update(status: "currently_buddy_requested")
      end
    else
      @connection.update(status_receiver: "buddy_requested")
      if @connection.status_sender == "buddy_requested"
        @connection.update(status: "buddied")
      else
        @connection.update(status: "currently_buddy_requested")
      end
    end
    redirect_to connection_path(@connection)
  end

  def cancel
    current_connected = current_user.connections.where(status: "currently_connected")
    current_connected.each do |connection|
      connection.update(status: "connected")
    end
    current_requested = current_user.connections.where(status: "currently_buddy_requested")
    current_requested.each do |connection|
      connection.update(status: "buddy_requested")
    end
    current_user.cancel_session!
    redirect_to root_path
  end

  def index
    @connections = current_user.connections.where(status: "currently_buddy_requested")
    @connections += current_user.connections.where(status: "currently_connected")
  end

  def show
    @connection = Connection.find(params[:id])
    @buddy = @connection.sender == current_user ? @connection.receiver : @connection.sender
    @questions = Question.all
    @buddy_user_responses = @buddy.user_responses.map do |user_response|
      user_response.response.answer
    end
    @current_user_responses = current_user.user_responses.map do |user_response|
      user_response.response.answer
    end
  end

  private

  def create_connections(matches)
    num = 0
    i = 0
    connections = []
    while num < 5 && i < matches.size
      connection = Connection.connection_of(current_user, matches[i][0])
      if connection.present?
        if connection.status == "connected"
          connection.update(status: "currently_connected")
          connections << connection
          num += 1
        end
      else
        connections << Connection.create(sender: current_user, receiver: matches[i][0], score: matches[i][1], status: "currently_connected")
        num += 1
      end
      i += 1
    end
    connections
  end

  def retrieve_buddies(users)
    current_user_data = retrieve_all_data(current_user)
    weights = compute_weight(current_user_data)
    options = []
    users.each do |user|
      options << [user, compute_total_score(current_user_data, weights, user)]
    end
    options.sort_by { |option| -option[1] }
  end

  def retrieve_all_data(user)
    user_data = user.user_responses.includes(:response).group_by {
      |ur| ur.response.question_id
    }
    return user_data
  end

  def compute_weight(current_user_data)
    weights = []
    current_user_data.each_value do |responses_chosen|
      weights << responses_chosen.size
    end
    return weights
  end

  def compute_total_score(current_user_data, weights, target_user)
    raw_score = []
    target_data = retrieve_all_data(target_user)
    current_user_data.each do |key, value|
      raw_score << compute_component_score(value, target_data[key])
    end
    total_score = 0
    raw_score.each_with_index do |component_score, index|
      total_score += component_score * weights[index]
    end
    total_weight = 0
    weights.each do |weight|
      total_weight += weight
    end
    total_score = total_score * 100 / total_weight
    return total_score.round
  end

  def compute_component_score(current_user_component_data, target_component_data)
    score = 0
    unless current_user_component_data.nil? || target_component_data.nil?
      current = current_user_component_data.map { |ur| ur.response }
      target = target_component_data.map { |ur| ur.response }
      overlap_component_data = current & target
      score = overlap_component_data.size.to_f / current_user_component_data.size
    end
    return score
  end
end
