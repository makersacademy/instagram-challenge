class Photo < ApplicationRecord

  has_many :comments, dependent: :destroy
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "http://i234.photobucket.com/albums/ee136/suwarnaadi/hair/rick-astley-80s-hairstyle.jpg"

  validates :image, presence: true
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
