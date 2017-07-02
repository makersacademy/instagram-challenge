class User < ApplicationRecord
  include Clearance::User
  has_many :posts
  has_many :comments
  has_many :likes
end
