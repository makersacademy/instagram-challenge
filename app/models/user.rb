class User < ActiveRecord::Base

  has_many :photos, dependent: :destroy
  has_many :photo_comments, through: :comments, source: :photo
  has_many :photo_likes, through: :likes, source: :photo


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
         has_attached_file :profile_pic,
         :styles => { :large => "900x900",
                      :medium => "300x300>",
                      :thumb => "100x100>" }
         validates_attachment_content_type :profile_pic,
         :content_type => /\Aimage\/.*\Z/

         validates_uniqueness_of :user_name

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.user_name = auth.info.name
      user.profile_pic = auth.info.image
    end
  end

end
