class Picture < ApplicationRecord
  validates :image, presence: true
  mount_uploader :image, PictureUploader
end
