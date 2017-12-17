class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user

  validates :image, presence: true
  validates :caption, length: { minimum: 3, maximum: 500 }
end
