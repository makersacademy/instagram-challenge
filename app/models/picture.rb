class Picture < ActiveRecord::Base

has_many :likes, dependent: :destroy
validates :description, length: {minimum: 1}
has_attached_file :image_url, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png", :path => "/images"
validates_attachment_content_type :image_url, :content_type => /\Aimage\/.*\Z/

end
