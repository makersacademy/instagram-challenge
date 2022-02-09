class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :image, presence: true
end
