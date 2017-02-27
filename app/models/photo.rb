class Photo < ApplicationRecord
  has_attached_file :image, :storage => :s3, :bucket => 'instamatt', :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
end
