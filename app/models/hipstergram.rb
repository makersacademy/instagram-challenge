class Hipstergram < ActiveRecord::Base

  belongs_to :hipster
  has_many :like_before_cools

  has_attached_file :image, :styles => { :large => "500x500", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"


  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :image, attachment_presence: true
 # validates :description, allow_blank: true
end
