class Image < ActiveRecord::Base

  has_attached_file :image, styles: {large: "675x675", medium: "500x500", small: "250x250", thumb: "150x150#"}

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :description, presence: true

  validates_attachment_presence :image

  has_many :comments, dependent: :destroy

end
