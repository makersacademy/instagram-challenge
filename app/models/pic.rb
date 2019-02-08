class Pic < ApplicationRecord
  belongs_to :user

  has_attached_file :image, styles: { medium: "100x100>", thumb: "50x50>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :title, presence: true, length: { minimum: 1 }
  validates :description, presence: true, length: { minimum: 1 }
end
