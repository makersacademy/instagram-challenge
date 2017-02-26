class User < ApplicationRecord
  has_many :posts
  has_many :comments
  acts_as_voter
  has_many :likes
  has_many :liked_posts, :through => :likes, :source => :post

  validates_presence_of :username
  validates :username, uniqueness: true, length: { maximum: 30,
    too_long: "%{count} characters is the maximum allowed" }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
