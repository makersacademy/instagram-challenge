class User < ApplicationRecord

  has_many :posts

  validates :email, :password_digest, :name, presence: true
  validates :email, :name, uniqueness: true

  has_secure_password

end
