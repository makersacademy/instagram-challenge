class Photo < ApplicationRecord
  validates :name, presence: true
  validates :image, presence: true
  mount_uploader :photo, PhotoUploader
end
