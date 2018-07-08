class Post < ApplicationRecord
  # belongs_to :user
  mount_uploader :image, ImageUploader
  validates :content, length: { maximum: 140 }
end
