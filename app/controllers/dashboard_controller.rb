class DashboardController < ApplicationController
  def index
    @buddies = current_user.connections.where(status: "buddied")
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
    sender_messaged = current_user.connections.where(status_sender: "messaged")
    receiver_messaged = current_user.connections.where(status_receiver: "messaged")
    buddied = current_user.connections.where(status: "buddied")
    total = sender_messaged + receiver_messaged
    total += buddied
    @connections = total.uniq
  end

  private

  def user_strong_params
    params.require(:user).permit(:first_name, :last_name, :age, :occupation, :gender, :address, :city, :photo, :country)
  end
end
