class Post < ApplicationRecord
  has_many :comments

  validates :caption, presence: true
  validates :image, presence: true

  mount_uploader :image, ImageUploader
end
