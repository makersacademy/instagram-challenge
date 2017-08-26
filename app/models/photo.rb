class Photo < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  has_attached_file :image, styles: { small: "100x100", med: "300x300", large: "200x200" }

  validates_attachment :image, presence: true,
  content_type: { content_type: /\Aimage\/.*\Z/ }
end
