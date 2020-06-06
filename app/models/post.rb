class Post < ApplicationRecord
   mount_uploader :image, ImageUploader
   belongs_to :account

   scope :active, -> { where active: true }
end
