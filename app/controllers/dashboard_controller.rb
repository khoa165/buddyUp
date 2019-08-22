class DashboardController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def update
    current_user.update(user_strong_params)
    redirect_to dashboard_path
  end

  private

  def user_strong_params
    params.require(:user).permit(:first_name, :last_name, :age, :occupation, :gender, :address, :city, :photo, :country)
  end
end
