class Post < ActiveRecord::Base
  has_attached_file :image, :storage => :cloudinary, :path => ':id/:style/:filename', styles: { large: "600x600>", medium: "3003x300>", thumb: "150x150>" }

  has_attached_file :video,
    :storage => :cloudinary,
    :cloudinary_resource_type => :video
end
