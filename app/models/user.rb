class User < ActiveRecord::Base
  attr_accessor :login
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         authentication_keys: [:login]
  devise :omniauthable, :omniauth_providers => [:facebook]

  has_many :photos, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :user_name, presence: true, uniqueness: { case_sensitive: false }
  validate :validate_user_name

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.find_for_database_authentication(warden_conditions)
   conditions = warden_conditions.dup
   login = conditions.delete(:login)
   if login
     find_by(["lower(user_name) = :value OR lower(email) = :value",
       { value: login.downcase }])
   elsif conditions.key?(:user_name) || conditions.key?(:email)
     find_by(conditions.to_hash)
   end
 end

 def validate_user_name
   errors.add(:user_name, :taken) if user_name_already_present_in_email_column?
 end

 private

 def user_name_already_present_in_email_column?
   self.class.where(email: user_name).exists?
 end

end
