# attr_accessor :photo_file_name

class Image < ActiveRecord::Base

  belongs_to :user
  # has_attached_file :photo,
    # :storage => :cloudinary

  has_attached_file :photo, styles: { standard: "500x500#", thumb: "150x150#" }, default_url: "/image/:style/missing.png", :storage => :cloudinary
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
end
