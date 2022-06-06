class Photo < ApplicationRecord

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  has_many :likes
  has_many :comments
  belongs_to :user

  def add_image_url
    update(image_url: self.photo.url(:medium))
  end

end
