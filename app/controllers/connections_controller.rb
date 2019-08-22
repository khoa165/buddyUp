class ConnectionsController < ApplicationController

  def search
    # users = User.geocoded

    # query = params[:location]
    # if query.present?
    #   # users = users.where("species ILIKE ?", "%#{query}%")
    #   users = users.near(query, 20)
    # else
    #   users = users.near([current_user.latitude, current_user.longitude], 20)
    # end
    # users = User.near([current_user.latitude, current_user.longitude], 20)
    users = User.all
    users = users.select { |user| user != current_user}
    @matches = retrieve_buddies(users).first(5)
    @connections = create_connections(@matches)
  end

  def index
    @connections = Connection.where(sender: current_user).where(status: "connected")
  end

  private

  def create_connections(matches)
    connections = []
    matches.each do |match|
      connections << Connection.create(sender: current_user, receiver: match[0])
    end
    return connections
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
