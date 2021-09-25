class Instapost < ApplicationRecord
  belongs_to :user
  mount_uploader :picture, PictureUploader
  has_many :comments
  acts_as_votable
end
