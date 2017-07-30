class Picture < ApplicationRecord
  mount_uploader :photo, PhotoUploader
end
