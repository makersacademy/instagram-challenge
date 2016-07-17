class Post < ApplicationRecord
  # has_attached_file :images, styles: { regular: "150x150>"}
  # validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
