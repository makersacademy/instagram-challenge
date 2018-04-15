class User < ApplicationRecord
  has_many :photos
  has_many :comments
  has_many :likes

  #validates :username, presence: true
  #validates :email, presence: true
  #validates :password, presence: true
end
