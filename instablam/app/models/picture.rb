class Picture < ApplicationRecord

  has_many :comments

  has_attached_file :image, styles: { small: "100x100", medium: "200x200", large: "300x300" }

  validates :title, presence: true
  validates_attachment :image, presence: true,
  content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
  size: { in: 0..500.kilobytes }
end
