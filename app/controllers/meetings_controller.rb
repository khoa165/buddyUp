class MeetingsController < ApplicationController
  before_action :set_connection, only: [:new, :create]
  before_action :set_meeting, only: [:edit, :update, :destroy]

  def show
    @meeting = Meeting.find(params[:id])
  end

  def new
    @meeting = Meeting.new
    @buddy = @connection.sender == current_user ? @connection.receiver : @connection.sender
  end

  def create
    @meeting = Meeting.new(meeting_strong_params)
    @meeting.connection = @connection
    if @meeting.save
      redirect_to dashboard_path
    else
      @meeting = Meeting.new
      render :new
    end
  end

  def edit
  end

  def update
    @meeting.update(meeting_strong_params)
    if @meeting.save
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  def destroy
    @meeting.destroy
    redirect_to meetings_path
  end

  private

  def meeting_strong_params
    params.require(:meeting).permit(:date, :location, :category, :activities, :notes)
  end

  def set_connection
    @connection = Connection.find(params[:connection_id])
  end

  def set_meeting
    @meeting = Meeting.find(params[:id])
  end
end
