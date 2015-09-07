class Photo < ActiveRecord::Base
  has_attached_file :image, :styles => { :large =>"750x750>", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  has_many :comments
  belongs_to :user
end
