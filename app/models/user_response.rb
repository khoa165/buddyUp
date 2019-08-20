class UserResponse < ApplicationRecord
  # Associations
  belongs_to :response
  belongs_to :user
end
