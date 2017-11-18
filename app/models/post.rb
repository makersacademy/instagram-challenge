class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :image, presence: true
  validates_processing_of :image, :content_type => /\Aimage\/.*\Z/
end
