class User < ApplicationRecord
  validates :username, presence: true
  validates :password, presence: true
  validates :forename, presence: true
  validates :lastname, presence: true
end
