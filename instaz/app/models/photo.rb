class Photo < ActiveRecord::Base
  
  has_many :comments, dependent: :destroy
  
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "cat.jpg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
