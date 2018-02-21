class Post < ApplicationRecord
  validates :image, presence: true
  
  has_attached_file :image, styles: { medium: "1080x" }

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
