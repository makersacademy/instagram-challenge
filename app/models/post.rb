class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  has_attached_file :image, styles: {
    square: '200x200#'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
