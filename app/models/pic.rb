class Pic < ApplicationRecord
  mount_uploader :url, PictureUploader
end
