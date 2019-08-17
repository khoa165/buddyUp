class DashboardController < ApplicationController
  def search
    @users = User.geocoded

    @users = @users.delete(current_user)

    # species_query = params[:species]
    # if species_query.present?
    #   @pets = @pets.where("species ILIKE ?", "%#{species_query}%").limit(20)
    # end


    @markers = @users.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        # infoWindow: render_to_string(partial: "info_window", locals: { pet: pet })
      }
    end
  end
end
