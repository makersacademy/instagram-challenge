class Post < ApplicationRecord
  has_one_attached :image
  validates :image, presence: true


end
