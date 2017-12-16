class Image < ApplicationRecord
  # validates_presence_of :imageurl

  mount_uploader :imageurl, ImageUploaderUploader

end
