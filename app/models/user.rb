class User < ActiveRecord::Base

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def already_likes?(post)
    post.liking_users.include?(self)
  end

  def user_owns_post?(post)
    self.posts.include?(post)
  end

end
