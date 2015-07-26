class Image < ActiveRecord::Base

  has_attached_file :image, styles: {large: "1000x1000", medium: "675x675", small: "500x500", thumb: "200x200>"}

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :description, presence: true

  validates_attachment_presence :image

end
