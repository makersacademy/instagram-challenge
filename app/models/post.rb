class Post < ApplicationRecord
  validates :caption, presence: true
  validates :image, presence: true
  
  mount_uploader :image, ImageUploader
end
