class Post < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :content, length: {minimum: 1}
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :user
end
