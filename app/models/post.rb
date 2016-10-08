class Post < ApplicationRecord

  validates :description, presence: true
  validates :image, presence: true

  has_attached_file :image, :styles => { medium: "300x300>", thumb: "400x400>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
