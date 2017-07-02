class Post < ApplicationRecord
  has_attached_file :avatar, styles:
  { small: "64x64",
    medium: "100x100",
    large: "200x200" }

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
