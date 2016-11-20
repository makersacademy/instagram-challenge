class Picture < ApplicationRecord
  mount_uploader :image, PictureUploader
end
