class Post < ApplicationRecord
  has_attached_file :image, styles: { large: "500x500>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  belongs_to :user
end
