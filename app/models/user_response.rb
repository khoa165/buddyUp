class UserResponse < ApplicationRecord
  belongs_to :response
  belongs_to :user
end
