# Post
class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates_presence_of :image

  belongs_to :user
  has_many :comments
end
