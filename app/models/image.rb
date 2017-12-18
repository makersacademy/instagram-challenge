require 'carrierwave/orm/activerecord'

class Image < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :user
end
