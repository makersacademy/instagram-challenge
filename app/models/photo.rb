class Photo < ApplicationRecord
  belongs_to :post
  mount_uploader :photo_path, PhotoUploader
end
