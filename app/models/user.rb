class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/avatar/thumb/user.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  has_many :photos, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_photos, through: :likes, source: :photo

  def owns?(photo)
    photo.user_id == self.id
  end

  def has_liked?(photo)
    self.liked_photos.include? photo
  end
end
