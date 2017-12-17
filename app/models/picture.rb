class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :comments
end
