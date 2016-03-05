class Photo < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "1000x1000>", :thumb => "500x500>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
