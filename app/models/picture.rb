class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :description, presence: true
  validates :image, presence: true

end
