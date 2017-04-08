class Post < ActiveRecord::Base
  has_attached_file :image, :storage => :cloudinary, :path => ':id/:style/:filename', styles: { large: "600x600>", medium: "3003x300>", thumb: "150x150>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
