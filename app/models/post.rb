class Post < ApplicationRecord
  has_attached_file :image, default_url: '/assets/images/missing.png'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
