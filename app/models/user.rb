class User < ActiveRecord::Base

  has_many :pictures
  has_many :comments
  has_many :likes

  devise :omniauthable, omniauth_providers: [:facebook]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.from_omniauth auth
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email || "#{auth.uid@facebook.com}"
      user.password = Devise.friendly_token[0,20]
    end
  end

  def self.new_with_session params, session
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
