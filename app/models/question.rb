class Question < ApplicationRecord
  # Associations
  has_many :responses, dependent: :destroy
  has_many :user_responses, through: :responses
end
