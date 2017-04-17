class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png", :url => ':s3_domain_url', :path => '/:class/:attachment/:id_partition/:style/:filename'
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end