class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :likes
  has_many :comments
  has_many :liked_posts, through: :posts, source: :likes

  def has_liked? post
    likes.where(post_id: post.id).present?
  end
end
