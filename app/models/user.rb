class User < ApplicationRecord
  has_secure_password

  # def self.authenticate(username, password)
  #   user = find_by_username(username)
  #   return nil  if user.nil?
  #   return user if user.has_password?(password)
  # end
end
