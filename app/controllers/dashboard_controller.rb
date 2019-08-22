class DashboardController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  def index
  end

  def show
  end

  def edit
  end

  def update
    @user.update(user_strong_params)
  end

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
        infoWindow: render_to_string(partial: "info_window", locals: { user: user }),
        image_url: helpers.asset_url('REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS')
      }
    end
  end

  private

  def user_strong_params
    params.require(:user).permit(:first_name, :last_name, :age, :occupation, :gender, :address, :city, :photo, :country)
  end

  def set_user
    @user = current_user
  end
end
