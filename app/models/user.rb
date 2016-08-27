class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :photos
  has_many :liked_photos, through: :likes, source: :photo

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  def has_created?(photo)
    id == photo.user_id 
  end

  def has_liked?(photo)
      liked_photos.include? photo
  end
end
