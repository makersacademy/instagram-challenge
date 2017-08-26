class Photo < ApplicationRecord
  has_attached_file :image, styles: { small: "100x100", med: "300x300", large: "200x200" }

  validates_attachment :image, presence: true,
  content_type: { content_type: /\Aimage\/.*\Z/ }
end
