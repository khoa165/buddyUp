class Response < ApplicationRecord
  # Associations
  belongs_to :question
  has_many :user_responses
end
