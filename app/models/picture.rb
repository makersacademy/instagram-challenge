class Picture < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_size :image, :less_than => 5.megabytes
  validates_attachment :image,
  content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
end
