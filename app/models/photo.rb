class Photo < ApplicationRecord
    mount_uploader :image_file, PhotoUploader
end
