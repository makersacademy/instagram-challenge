class Hipster < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

attr_accessor :login
  validate :validate_hipstername
  validates :email, uniqueness: true
  validates :hipstername, uniqueness: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  has_many :hipstergrams, dependent: :destroy
  has_many :like_before_cools

def validate_hipstername
  if Hipster.where(email: hipstername).exists?
    errors.add(:hipstername, :invalid)
  end
end

def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name  
  end
end


def self.find_first_by_auth_conditions(warden_conditions)
  conditions = warden_conditions.dup
  if login = conditions.delete(:login)
    where(conditions).where(["lower(hipstername) = :value OR lower(email) = :value", { :value => login.downcase }]).first
  else
    if conditions[:hipstername].nil?
      where(conditions).first
    else
      where(hipstername: conditions[:hipstername]).first
    end
  end
end

end
