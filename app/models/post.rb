class Post < ApplicationRecord

  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :tags, through: :post_tags
  has_many :post_tags, dependent: :destroy
  has_attached_file :image, styles: {small: "250x250!", medium: "500x500!", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
