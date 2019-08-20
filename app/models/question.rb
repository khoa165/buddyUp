class Question < ApplicationRecord
  # Associations
  has_many :responses, dependent: :destroy
end
