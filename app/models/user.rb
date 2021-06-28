class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :password, confirmation: true, length: { within: 6..30 }
  validates :password_confirmation, presence: true

  has_secure_password
end
