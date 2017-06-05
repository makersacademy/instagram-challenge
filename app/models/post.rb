require 'carrierwave/orm/activerecord'
require './app/uploaders/avatar_uploader'

class Post < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  belongs_to :user
end
