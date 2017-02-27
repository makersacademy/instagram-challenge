class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable,
           :omniauthable, :omniauth_providers => [:facebook]

  has_many :photos, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :commented_photos, through: :comments, source: :photos

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

 def has_commented?(photo)
   commented_photos.include? photo
 end

 def self.new_with_session(params, session)
   super.tap do |user|
     if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
       user.email = data["email"] if user.email.blank?
     end
   end
 end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end

    def cancel_facebook_sign_up
      redirect_to cancel_user_registration_path
    end
  end
end
