class User < ActiveRecord::Base
  before_save :add_feed_to_user

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :feed

  validates :username, presence: true

  private

  def add_feed_to_user
    self.feed = Feed.new
  end
end
