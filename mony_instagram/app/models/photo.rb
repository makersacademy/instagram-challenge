class Photo < ApplicationRecord
   mount_uploader :insta_photo, InstaPhotoUploader

   belongs_to :user
   has_many :comments
end
