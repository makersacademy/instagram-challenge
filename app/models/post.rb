class Post < ApplicationRecord
  IMAGE_HEIGHT = 600
  has_attached_file :image
  validates_attachment :image, :presence => true, content_type: { content_type: /\Aimage\/.*\Z/ }
  has_many :likes
  belongs_to :user
  has_many :comments
end
