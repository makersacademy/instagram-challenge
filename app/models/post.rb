class Post < ApplicationRecord
  validates :image, presence: true
  has_attached_file :image, styles: { :medium => "640x" }
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  has_many :comments
end
