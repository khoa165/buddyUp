class Connection < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :meetings, dependent: :destroy
  has_many :conversations, dependent: :destroy
  has_many :messages, through: :conversations, dependent: :destroy

end
