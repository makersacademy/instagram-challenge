class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :photos
  has_many :likes
  has_many :liked_photos, through: :likes, source: :photo
  has_many :comments
  has_many :commented_photos, through: :comments, source: :photo

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def build_photo(photo_params, current_user)
    photo = photos.create(photo_params)
    photo.user = current_user
    photo
  end

  def has_liked?(photo)
    liked_photos.include? photo
  end

end
