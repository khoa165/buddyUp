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

  def connection_strong_params
      params.require(:connection).permit()
  end

  def retrieve_buddies(users)
    options = []
    users.each do |user|
      options << [user, compute_score(current_user, user)]
    end
    options.sort_by { |option| -option[1] }
  end

  def compute_score(current_user, target_user)

  end
end
