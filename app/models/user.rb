class User < ApplicationRecord
  has_secure_password
  has_many :posts
  
  validates :email, presence: true
  validates :username, presence: true
  validates :password_digest, presence: true
  validates :bio, length: { maximum: 150 }
  validates_uniqueness_of :email
  validates_uniqueness_of :username
  # I don't know how to combine validators and refactor
end
