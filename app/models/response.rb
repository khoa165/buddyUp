class Response < ApplicationRecord
  belongs_to :question
  has_many :user_responses
end
