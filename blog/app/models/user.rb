class User < ApplicationRecord
    has_secure_password

    # attr_accessor :username, :email, :password, :password_confirmation

    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true
end
