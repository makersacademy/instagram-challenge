class Image < ApplicationRecord
  has_many :comments 
  mount_uploader :imageurl, ImageUploaderUploader

end
