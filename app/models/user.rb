class User < ActiveRecord::Base
  before_create :add_feed_to_user

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :feed

  validates :username, presence: true
  validates_uniqueness_of :username, case_sensitive: false

  private

  def add_feed_to_user
    self.feed = Feed.new
  end
end
