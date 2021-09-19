require_relative 'application_record'

class User < ApplicationRecord
    has_secure_password
    validates_uniqueness_of :username, :email
end
