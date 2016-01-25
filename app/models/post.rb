class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates_presence_of :title, :image

  mount_uploader :image, PhotoUploader
end
