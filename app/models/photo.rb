class Photo < ApplicationRecord

  has_many :comments
  has_many :reactions

  has_attached_file :image, :styles => { :large => "<600x600>", :medium => "1000x1000>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
