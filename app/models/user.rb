class User < ApplicationRecord
  # has_many :posts
  # validates :email, uniqueness: true, format: { with: /.*@.*/ }
  # has_one_attached :avatar

  has_secure_password
end
