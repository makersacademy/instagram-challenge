class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :picture
  validates :name, presence: true, length: { minimum: 3 }
  validates :comment, presence: true, length: { minimum: 5 }
end
