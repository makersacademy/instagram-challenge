class Post < ApplicationRecord
  validates_presence_of :description
  attr_accessor :image
  mount_uploader :image, ImageUploader
  has_many :comments, dependent: :destroy
end
