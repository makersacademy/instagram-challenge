class Post < ApplicationRecord
  validates_presence_of :description
  attr_accessor :image
  mount_uploader :image, ImageUploader
end
