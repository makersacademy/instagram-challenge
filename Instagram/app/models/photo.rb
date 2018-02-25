class Photo < ApplicationRecord
  mount_uploader :image, ImageUploader
end
