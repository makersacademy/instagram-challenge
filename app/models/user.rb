class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
         has_attached_file :profile_pic, :styles => { :large => "900x900", :medium => "300x300>", :thumb => "100x100>" }
        #  :default_url => "http://i3.manchestereveningnews.co.uk/incoming/article527965.ece/ALTERNATES/s615/C_71_article_1088573_image_list_image_list_item_0_image.jpg"
         validates_attachment_content_type :profile_pic, :content_type => /\Aimage\/.*\Z/
         validates_uniqueness_of :user_name

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.user_name = auth.info.name   # assuming the user model has a name
      user.profile_pic = auth.info.image # assuming the user model has an image
    end
  end

end
