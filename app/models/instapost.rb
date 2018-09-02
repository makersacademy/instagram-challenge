class Instapost < ApplicationRecord
  mount_uploader :picture, PictureUploader
end
