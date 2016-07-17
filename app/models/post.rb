class Post < ApplicationRecord
  has_attached_file :image, styles: { regular: "150x150>"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  has_many :comments, dependent: :destroy
end
