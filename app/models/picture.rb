class Picture < ApplicationRecord
  has_attached_file :image, :styles => { :medium => "1000x600>", :thumb => "200x200>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  has_many :comments, dependent: :destroy
end
