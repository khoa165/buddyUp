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
    if @message.save
      respond_to do |format|
        format.html { redirect_to connection_messages_path(@connection) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'messages/show' }
        format.js  # <-- idem
      end
    end
  end

  private

  def message_strong_params
    params.require(:message).permit(:content, :connection_id)
  end
end
