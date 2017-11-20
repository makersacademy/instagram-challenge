class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates :caption, presence: true, length: { maximum: 2200 }
  validates :image, presence: true, file_size: { less_than: 1.megabytes }
end
