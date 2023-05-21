class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :image
  validates :comment, presence: true
end
