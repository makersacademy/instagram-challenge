class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  mount_uploader :photo, PhotoUploader
end
