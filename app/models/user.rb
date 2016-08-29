class User < ActiveRecord::Base
  before_create :add_feed_to_user

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

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

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.username = auth.info.email.split('@')[0]
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
        user.username = data["email"].split('@')[0] if user.username.blank?
      end
    end
  end

  private

  def add_feed_to_user
    self.feed = Feed.new
  end
end
