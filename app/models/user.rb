class User < ApplicationRecord
  include Clearance::User
  PROFILE_PIC_SIZES = { nav: 40, small: 50, medium: 150, large: 300 }
  validates_presence_of :name, :username
  has_many :posts
  has_many :comments
  attr_accessor :picture
  mount_uploader :picture, ImageUploader
end
