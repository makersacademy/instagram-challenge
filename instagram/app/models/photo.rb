class Photo < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	belongs_to :user

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/default_image.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	validates_presence_of :description
end
