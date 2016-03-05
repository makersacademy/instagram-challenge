class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
        #  has_attached_file :profile_pic, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "app/assets/images/placeholder/profile_pic_placeholder.jpg"
        #  validates_attachment_content_type :profile_pic, :content_type => /\Aimage\/.*\Z/


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.user_name = auth.info.name   # assuming the user model has a name
      # user.profile_pic = auth.info.image # assuming the user model has an image
    end
  end

end
