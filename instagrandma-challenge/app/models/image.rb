class Image < ApplicationRecord
    has_attached_file :snappysnap, styles: { large:"600x600>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :snappysnap, content_type: /\Aimage\/.*\z/

  validates :title, presence: true
  # validates :location, presence: true
  validates :snappysnap, presence: true
end
