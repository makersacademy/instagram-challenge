class User < ApplicationRecord
  has_secure_password
  has_many :posts
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :username, presence: true
  validates :password, presence: true, allow_blank: true, length: { minimum: 4 , maximum: 10 }
end
