class Photo < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :comments
end
