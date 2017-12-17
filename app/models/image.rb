class Image < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  
  has_many :reactions
  has_many :likes
  belongs_to :user
end
