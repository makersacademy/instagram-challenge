class Post < ActiveRecord::Base

  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "400x400" }

  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  has_many :comments, dependent: :destroy
  
end
