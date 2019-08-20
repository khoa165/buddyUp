class ConnectionsController < ApplicationController
  def index

    users = User.geocoded
    users = users.where.not(user: current_user)
    @matches = compute_score(current_user, users)

    # species_query = params[:species]
    # if species_query.present?
    #   @pets = @pets.where("species ILIKE ?", "%#{species_query}%").limit(20)
    # end
  end

  private

  def connection_strong_params
      params.require(:connection).permit()
  end

  def compute_score(current_user, matches)

  end
end
