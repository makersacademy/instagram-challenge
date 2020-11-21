class Post < ApplicationRecord
  validates_presence_of :image
  mount_uploader :image, ImageUploader
  belongs_to :user
end
