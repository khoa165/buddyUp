class ConnectionsController < ApplicationController
  def index
    users = User.geocoded
    users = users.where.not(user: current_user)
    @matches = retrieve_buddies(users)

    # species_query = params[:species]
    # if species_query.present?
    #   @pets = @pets.where("species ILIKE ?", "%#{species_query}%").limit(20)
    # end
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
