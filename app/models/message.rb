class Message < ApplicationRecord
  after_create :broadcast_message
  # Associations
  belongs_to :user
  belongs_to :connection

  def broadcast_message
    ActionCable.server.broadcast("connection_#{connection.id}", {
      message_partial: ApplicationController.renderer.render(
        partial: "messages/ariving_message",
        locals: { message: self, user_is_messages_author: false }
      ),
      current_user_id: user.id
    })
  end
end
