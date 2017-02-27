class Post < ActiveRecord::Base

  belongs_to :user
  has_many :comments
  
  mount_uploader :picture, PictureUploader
end
