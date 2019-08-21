class ConnectionsController < ApplicationController
  def index
    # users = User.geocoded
    # users = users.where.not(user: current_user)

    # query = params[:location]
    # if query.present?
    #   # users = users.where("species ILIKE ?", "%#{query}%")
    #   users = users.near(query, 20)
    # else
    #   users = users.near([current_user.latitude, current_user.longitude], 20)
    # end

    users = User.all.select { |user| user != current_user}
    @matches = retrieve_buddies(users)
  end

  private

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
    return total_score.round
  end

  def compute_component_score(current_user_component_data, target_component_data)
    score = 0
    unless current_user_component_data.nil? || target_component_data.nil?
      overlap_component_data = current_user_component_data & target_component_data
      score = overlap_component_data.size.to_f / current_user_component_data.size
    end
    return score
  end
end
