class Post < ApplicationRecord

  has_attached_file :image, :styles => { :medium => "1200x1200", :thumb => "640x640>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  validates :caption, length: { minimum: 3 }
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :user

end
