class Post < ApplicationRecord

  has_attached_file :image, :styles => { :medium => "900x900>", :thumb => "500x500>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  validates :caption, length: { minimum: 3 }
  has_many :comments, dependent: :destroy

end
