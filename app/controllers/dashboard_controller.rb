class DashboardController < ApplicationController
  def index
    @buddies = current_user.connections.where(status: "buddied")
    c = current_user.connections.where.not(status: "buddied")
    sender_c = c.where(sender: current_user)
    receiver_c = c.where(receiver: current_user)
    sender_c_requesting = sender_c.where(status_sender: "buddy_requested")
    sender_c_requested = sender_c.where(status_receiver: "buddy_requested")
    receiver_c_requesting = receiver_c.where(status_receiver: "buddy_requested")
    receiver_c_requested = receiver_c.where(status_sender: "buddy_requested")
    @requesting = sender_c_requesting + receiver_c_requesting
    @requested = sender_c_requested + receiver_c_requested
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
      # current_user.mark_user_visited
      redirect_to questions_path
    else
      redirect_to dashboard_profile_path
    end
  end

  def messages
    sender_messaged = current_user.connections.where(status_sender: "messaged")
    receiver_messaged = current_user.connections.where(status_receiver: "messaged")
    br = current_user.connections.where(status: "buddy_requested")
    cbr = current_user.connections.where(status: "currently_buddy_requested")
    buddied = current_user.connections.where(status: "buddied")
    total = sender_messaged + receiver_messaged
    total += buddied + br + cbr
    total_with_message = total.uniq.select do |c|
      c.messages.size > 0
    end
    @connections = total_with_message.sort_by do |c|
      c.messages.last.created_at
    end
    @connections = @connections.reverse
  end

  private

  def user_strong_params
    params.require(:user).permit(:first_name, :last_name, :age, :occupation, :gender, :address, :city, :photo, :country)
  end
end
