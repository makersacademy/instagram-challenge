class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  has_attached_file :image, styles: {large: "600x600#", medium: "300x300#", thumb: "100x100#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
