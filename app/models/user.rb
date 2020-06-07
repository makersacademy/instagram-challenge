class User < ApplicationRecord
  has_secure_password
  has_many :pictures

  validates_presence_of :full_name, :username, :email, :password
  validates_uniqueness_of :email, :username
  validates_length_of :password, :minimum => 6
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
