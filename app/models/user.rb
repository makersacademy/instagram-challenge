class User < ApplicationRecord
  include Clearance::User
  has_many :posts
  has_many :likes
  has_many :liked_posts, through: :likes, source: :posts
end
