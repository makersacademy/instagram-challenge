class Picture < ApplicationRecord

  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_attached_file :image

  validates :title, presence: true
  validates_attachment :image, presence: true,
  content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
  size: { in: 0..1000.kilobytes }
end
