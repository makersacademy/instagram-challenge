class Post < ApplicationRecord
  validates :image, attachment_presence: true

  has_attached_file :image, styles: { medium: "500px"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
