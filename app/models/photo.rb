class Photo < ApplicationRecord
  has_attached_file :image,
                     styles: { :large => "500x500>", :medium => "400x400>" },
                     default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
