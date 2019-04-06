require 'carrierwave/orm/activerecord'

class Post < ApplicationRecord
    # attr_accessor :picture
    mount_uploader :picture, PictureUploader
end
