class Photo < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	belongs_to :user

	has_many :likes, dependent: :destroy
  has_many :liking_users, :through => :likes, :source => :user


  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	validates_presence_of :description
end
