class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\S*@[a-z]*\.[a-z]{2,30}([a-z]|\.[a-z]{2,30})/i
  validates :email, presence: true, format: {with:  VALID_EMAIL_REGEX }
end
