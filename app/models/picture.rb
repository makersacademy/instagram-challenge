class Picture < ApplicationRecord
  validates :comment, length: { maximum: 240 }
  validates :image, presence: true
  mount_uploader :image, PictureUploader
end
