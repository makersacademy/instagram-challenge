class User < ApplicationRecord
  has_secure_password(attribute= :password, validations: true)
end
