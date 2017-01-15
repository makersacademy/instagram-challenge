class Picture < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_attached_file :image, :styles => { :medium => "600x700>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
