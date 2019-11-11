class User < ApplicationRecord
  has_secure_password
  has_many :posts

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6, maximum: 10 }, :if => :password
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
