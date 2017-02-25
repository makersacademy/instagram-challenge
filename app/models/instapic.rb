class Instapic < ApplicationRecord
  belongs_to :user

  has_attached_file :image, :styles => { :medium => "600x600>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/


end
