class Post < ActiveRecord::Base
  has_attached_file :image, :styles => { :thumb => "600x600>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
