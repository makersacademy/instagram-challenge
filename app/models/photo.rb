class Photo < ActiveRecord::Base

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_presence :image, message: "Must add a photo"

  has_many :comments, dependent: :destroy
  has_many :favourites, dependent: :destroy
  belongs_to :user

end
