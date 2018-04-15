class Post < ApplicationRecord
  # Validate moment content_type for medium and thumb sizes and file types
  has_attached_file :moment, styles: { medium: "300x300>", thumb: "80x80>" }, default_url: "/images/:style/moment-default.jpg"
  validates_attachment_content_type :moment, content_type: ['image/jpeg', 'image/jpg', 'image/gif', 'image/png']
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
end
