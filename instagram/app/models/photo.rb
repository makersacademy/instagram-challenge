class Photo < ApplicationRecord
  mount_uploader :picture, PictureUploader
end
