require 'carrierwave/orm/activerecord'
require './app/uploaders/avatar_uploader'

class User < ApplicationRecord
  has_many :posts
  has_secure_password
  mount_uploader :avatar, AvatarUploader
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { message: "that email address is taken" }
end
