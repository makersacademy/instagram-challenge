class User < ApplicationRecord
  include Clearance::User
  has_many :posts
  has_many :comments

  mount_uploader :profile_picture, ProfilePictureUploader

  validates_presence_of :username
  validates_uniqueness_of :username
end
