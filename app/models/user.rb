class User < ApplicationRecord
  include Clearance::User
  validates_presence_of :name, :username
  has_many :posts
  has_many :comments
end
