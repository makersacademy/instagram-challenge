class Comment < ApplicationRecord
  belongs_to :user
  validates :user_id, length: { minimum: 1 }, allow_nil: true
end
