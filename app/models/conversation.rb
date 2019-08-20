class Conversation < ApplicationRecord
  # Associations
  belongs_to :connection
  has_many :messages, dependent: :destroy
end
