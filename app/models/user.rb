class User < ApplicationRecord
  include Clearance::User
  has_many :posts

  validates_presence_of :username
  validates_uniqueness_of :username
end
