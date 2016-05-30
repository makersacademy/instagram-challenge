class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post

  has_many :follower_relationships, class_name: "Followrelationship",
  																	foreign_key: "follower_id",
  																	dependent: :destroy
  has_many :followed_relationships, class_name: "Followrelationship",
  																	foreign_key: "followed_id",
  																	dependent: :destroy
  has_many :following, through: :follower_relationships, source: :followed
  has_many :followers, through: :followed_relationships, source: :follower

  has_many :posts_following, through: :following, source: :posts

end
