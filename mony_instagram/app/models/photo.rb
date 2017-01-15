class Photo < ApplicationRecord
   mount_uploader :insta_photo, InstaPhotoUploader
end
