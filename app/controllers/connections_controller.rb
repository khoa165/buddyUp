class ConnectionsController < ApplicationController
  def index
    users = User.geocoded
    users = users.where.not(user: current_user)

    query = params[:location]
    if query.present?
      # users = users.where("species ILIKE ?", "%#{query}%")
      users = users.near(query, 20)
    else
      users = users.near([current_user.latitude, current_user.longitude], 20)
    end

    @matches = retrieve_buddies(users)
  end

  private

  def retrieve_buddies(users)
    current_user_data = retrieve_current_user_data
    weights = compute_weight(current_user_data)
    options = []
    users.each do |user|
      options << [user, compute_total_score(current_user_data, weights, user)]
    end
    options.sort_by { |option| -option[1] }
  end

  def retrieve_current_user_data
    current_user_data = current_user.user_responses.includes(:response).group_by {
      |ur| ur.response.question_id
    }
    return current_user_data
  end

  def compute_weight(current_user_data)
    weights = []
    current_user_data.each_value do |responses_chosen|
      weights << responses_chosen.size
    end
    return weights
  end

  def compute_total_score(current_user_data, weights, target_user)
    target_data = target_user.user_responses.includes(:response).group_by {
      |ur| ur.response.question_id
    }
    current_user_data.each_value do |responses_chosen|

    end
  end
end
