class Photo < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes
  belongs_to :user
  validates :image, presence: true
  has_attached_file :image, styles: {medium: "300x300>"}, defaul_url: "/images/image_missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
