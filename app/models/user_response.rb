class UserResponse < ApplicationRecord
  # Associations
  belongs_to :response
  belongs_to :user
  validates :user, uniqueness: { scope: :response }
end
