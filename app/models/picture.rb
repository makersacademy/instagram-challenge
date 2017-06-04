class Picture < ApplicationRecord
  has_many :comments

  has_attached_file :image, styles: {unique: "300x300" }
  validates_attachment_content_type :image, :content_type => ['image/jpg', 'image/jpeg', 'image/png']
end
