class Image < ApplicationRecord

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/img/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
