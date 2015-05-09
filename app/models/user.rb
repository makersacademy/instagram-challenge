class User < ActiveRecord::Base

  has_many :likes
  has_many :images
  has_many :liked_images, through: :likes, source: :image

    # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def already_liked? image
    liked_images.include? image
  end
end
