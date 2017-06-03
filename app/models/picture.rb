class Picture < ApplicationRecord
  has_attached_file :image, styles: {unique: "500x500" }
  validates_attachment_content_type :image, :content_type => ['image/jpg', 'image/jpeg', 'image/png']
end
