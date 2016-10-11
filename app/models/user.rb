class User < ActiveRecord::Base

  validates :user_name, presence: true, length: { minimum: 3, maximum: 16 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  def self.from_omniauth(auth)
    user = User.where(email: auth.info.email).first

    if user
      return user
    else
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider 
        user.uid = auth.uid 
        user.email = auth.info.email 
        user.image = auth.info.image
        user.password = Devise.friendly_token[0,20]
      end
    end
  end
end
