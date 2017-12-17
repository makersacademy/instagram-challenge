class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :comments
  belongs_to :user
end
