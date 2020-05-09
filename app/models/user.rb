class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: true
  validates :email, uniqueness: true

  has_many :posts, dependent: :destroy
  has_many :comments, through: :posts, dependent: :destroy
end
