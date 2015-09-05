class Picture < ActiveRecord::Base

  has_many :comments

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/restaurant-md.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
