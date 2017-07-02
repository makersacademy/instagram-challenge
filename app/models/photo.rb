class Photo < ApplicationRecord
    mount_uploader :image_file, PhotoUploader
    belongs_to :user
end
