class Post < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "300x600>", :thumb => "100x300>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
