class Post < ActiveRecord::Base
  validates_presence_of :title, :image

  mount_uploader :image, PhotoUploader
end
