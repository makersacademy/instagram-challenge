class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader
end
