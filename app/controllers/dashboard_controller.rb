class DashboardController < ApplicationController
  def index
  end

  def show
    @user = current_user
    @questions = Question.all
  end

  def edit
  end

  def update
    current_user.update(user_strong_params)
    if current_user.new_user?
      current_user.mark_user_visited
      redirect_to questions_path
    else
      redirect_to dashboard_path
    end
  end

  def messages
    current = current_user.connections.where(status: "currently_connected")
    buddied = current_user.connections.where(status: "buddied")
    @connections = current + buddied
  end

  private

  def user_strong_params
    params.require(:user).permit(:first_name, :last_name, :age, :occupation, :gender, :address, :city, :photo, :country)
  end
end
