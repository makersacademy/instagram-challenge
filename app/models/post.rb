class Post < ApplicationRecord
  validates :image, presence: true
  has_one_attached :image
end
