class Photograph < ApplicationRecord
  has_attached_file :image, :styles => { :medium => "600x600>", :thumb => "300x300>" }, :default_url => "/photographs"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
