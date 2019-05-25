class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true
  validates :name, presence: true
  validates :username, presence: true
  validates :password, presence: true, length: { minimum: 4 , maximum: 10 }
end
