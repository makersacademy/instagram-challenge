class Picture < ApplicationRecord
  belongs_to :user
  has_many :comments 
  mount_uploader :image, PictureUploader
end
