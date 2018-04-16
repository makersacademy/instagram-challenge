class Comment < ApplicationRecord
  belongs_to :image
  validates :comment, presence: true
  validates :commenter, presence: true
end
