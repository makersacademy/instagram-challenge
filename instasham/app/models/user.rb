class User < ApplicationRecord
  has_many :posts
  has_many :comments
  acts_as_voter

  mount_uploader :avatar, AvatarUploader

  # attr_accessible :email, :password, :remember_me, :avatar, :avatar_cache, :remove_avatar

  # validates_presence_of   :avatar
  validates_integrity_of  :avatar
  validates_processing_of :avatar
  validates_presence_of :username
  validates :username, uniqueness: true, length: { maximum: 30,
    too_long: "%{count} characters is the maximum allowed" }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
