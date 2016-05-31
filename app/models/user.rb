class User < ActiveRecord::Base
  validates :user_name, presence: true, length: { minimum: 4, maximum: 16 }

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
  :omniauth_providers => [:facebook]

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email 
      user.user_name = auth.info.first_name
      user.password = Devise.friendly_token[0,20]
    end
  end
end
