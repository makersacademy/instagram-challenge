class Picture < ActiveRecord::Base

	has_many :comments, dependent: :destroy


	has_attached_file :image, :styles => { :medium => "1024x768>", :thumb => "300x300>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
