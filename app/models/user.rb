class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :digs, dependent: :destroy
  has_many :digged_posts, through: :digs, source: :post

  def has_no_snapshots?
    posts.count == 0
  end

  def has_not_digged?(post)
    digged_posts.include?(post) ? false : true
  end

  def posts_sorted_recent_first
    posts.sort_by { |p| p[:created_at] }.reverse
  end

end
