class Post < ApplicationRecord
  validates :image, presence: true
  has_attached_file :image, styles: { :medium => "640x" }
  validates :caption, length: { minimum: 3, maximum: 300 }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
