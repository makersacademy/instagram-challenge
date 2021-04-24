class User < ApplicationRecord
  has_secure_password
  validates :forename, presence: true
  validates :surname, presence: true
  validates :username, presence: true
  validates :email, presence: true
  validates :password, presence: true
  has_many :posts, dependent: :destroy
end
