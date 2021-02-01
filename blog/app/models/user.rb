class User < ApplicationRecord
    has_secure_password
    acts_as_voter
    # attr_accessor :username, :email, :password, :password_confirmation

    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true
end
