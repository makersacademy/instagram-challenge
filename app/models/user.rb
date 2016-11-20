class User < ApplicationRecord
  has_one :feed
  has_many :photos
  has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :build_default_feed

  def build_default_feed
    p User.last
    self.feed = Feed.create(user_id: User.last.id)
  end
end
