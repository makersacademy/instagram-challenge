class User < ApplicationRecord
  has_many :posts
  has_secure_password

end
