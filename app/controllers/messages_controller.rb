class MessagesController < ApplicationController
  def index
    @connection = Connection.find(params[:connection_id])
    @messages = @connection.messages
    @message = Message.new
  end

  def create
    @message = Message.new(message_strong_params)
    @connection = Connection.find(params[:connection_id])
    @message.connection = @connection
    @message.user = current_user
    @message.save
    redirect_to connection_messages_path(@connection)

  end

  private

  def message_strong_params
    params.require(:message).permit(:content, :connection_id)
  end
end
