class Image < ApplicationRecord
  has_attached_file :image, styles: { small: "100x100", med: "250x250", large: "500x500" }
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }
  has_many :comments
  has_many :hearts
  validates :caption, presence: true
  validates :image, presence: true
  validates :user, presence: true
end
