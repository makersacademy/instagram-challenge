class Post < ApplicationRecord
  has_attached_file :image, styles: { medium: "800x" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
