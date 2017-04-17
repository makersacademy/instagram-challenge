class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_attached_file :image, styles: { medium: "300x300>", thumb: "200x200>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
