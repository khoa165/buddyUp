class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:edit, :update, :destroy]

  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.new(meeting_strong_params)
    connection = Connection.find(params[:connection_id])
    @meeting.connection = connection
    if @meeting.save
      redirect_to connection_path(connection)
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
      redirect_to connection_path(connection)
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
    params.require(:meeting).permit(:start_date, :end_date)
  end

  def set_meeting
    @meeting = Meeting.find(params[:id])
  end
end
