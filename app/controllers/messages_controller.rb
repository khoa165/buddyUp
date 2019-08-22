class MessagesController < ApplicationController
  def index
    @connection = Connection.find(params[:connection_id])
    @messages = @connection.messages
  end
end
