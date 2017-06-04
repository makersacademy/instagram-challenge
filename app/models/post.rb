class Post < ApplicationRecord
  IMAGE_HEIGHT = 400
  has_many :likes
  has_many :comments
  belongs_to :user
  attr_accessor :image
  mount_uploader :image, ImageUploader
end
