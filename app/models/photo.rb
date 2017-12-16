class Photo < ApplicationRecord
  mount_uploader :photo, PhotoUploader
end
