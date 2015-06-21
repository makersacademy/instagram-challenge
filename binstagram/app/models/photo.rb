class Photo < ActiveRecord::Base
  has_many :comments
  has_attached_file :image, :styles => { :medium => "300X300>", :thumb => "100x100>" }, :default_url => '/images/:style/missing.png'
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :name, length: { minimum: 1 }, uniqueness: false
end
