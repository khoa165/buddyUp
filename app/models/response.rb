class Response < ApplicationRecord
  # Associations
  belongs_to :question
  has_many :user_responses

  def of(user)
    user_responses.find_by(user: user)
  end
end
