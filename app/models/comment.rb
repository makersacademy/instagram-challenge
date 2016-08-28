class Comment < ApplicationRecord
  validates :comment, length: { minimum: 1 }
  belongs_to :user
end
