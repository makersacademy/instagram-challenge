class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :content, length: { maximum: 140 }
end
