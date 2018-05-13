class User < ApplicationRecord
  # validates :username, presence: true, length: { minimum: 2, maximum: 20 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  def self.from_omniauth(auth)
    if self.where(email: auth.info.email).exists?
      return_user = self.where(email: auth.info.email).first
      return_user.provider = auth.provider
      return_user.uid = auth.uid
    else
      return_user = self.create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        # user.name = auth.info.name
        user.username = auth.info.username
        user.email = auth.info.email
        user.password = Devise.friendly_token[0, 20]
        # user.oauth_token = auth.credentials.token
        # user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      end
    end
    return_user
  end
end
