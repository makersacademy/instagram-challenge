class User < ActiveRecord::Base
  before_create :add_feed_to_user

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :feed, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :active_relationships, class_name: 'Following',
                                  foreign_key: 'follower_id',
                                  dependent: :destroy
  has_many :passive_relationships, class_name:  "Following",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :following, through: :active_relationships, source: :followed

  validates :username, presence: true
  validates_uniqueness_of :username, case_sensitive: false

  def following?(user)
    following.include? user
  end

  def follow(user)
    active_relationships.create(followed_id: user.id) unless user == self
  end

  def unfollow(user)
    active_relationships.find_by(followed_id: user.id).destroy
  end

  private

  def add_feed_to_user
    self.feed = Feed.new
  end
end
