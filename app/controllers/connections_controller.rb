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
    options = []
    users.each do |user|
      options << [user, compute_score(user)]
    end
    options.sort_by { |option| -option[1] }
  end

  def compute_score(target_user)
    current_user.user_responses.includes(:response).group_by {
      |ur| ur.response.question_id
    }
    target_user.user_responses.includes(:response).group_by {
      |ur| ur.response.question_id
    }
  end
end
