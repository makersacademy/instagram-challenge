class Image < ActiveRecord::Base

  belongs_to :user

  has_attached_file :image, styles: { medium: "500x500>", thumb: "300x300>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_attachment_presence :image
end
