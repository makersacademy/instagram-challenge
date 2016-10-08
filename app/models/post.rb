class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates :image, attachment_presence: true
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :caption, length: {maximum: 140}
end
