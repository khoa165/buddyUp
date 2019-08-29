class MessagesController < ApplicationController
  def index
    @connection = Connection.find(params[:connection_id])
    @buddy = @connection.sender == current_user ? @connection.receiver : @connection.sender
    @messages = @connection.messages
    @messages.each do |m|
      unless m.user == current_user
        m.mark_seen!
      end
    end
    @message = Message.new
    # respond_to do |format|
    #   format.js  # <-- render `app/views/messages/index.js.erb`
    # end
  end

  def create
    @message = Message.new(message_strong_params)
    @connection = Connection.find(params[:connection_id])
    @message.connection = @connection
    @message.user = current_user
    if @message.save
      if current_user == @connection.sender
        @connection.update(status_sender: "messaged")
      else
        @connection.update(status_receiver: "messaged")
      end
      respond_to do |format|
        format.html { redirect_to connection_messages_path(@connection) }
        format.js  # <-- will render `app/views/messages/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'messages/index' }
        format.js  # <-- idem
      end
    end
  end

  private

  def message_strong_params
    params.require(:message).permit(:content, :connection_id)
  end
end
