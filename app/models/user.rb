class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :images
  has_many :comments
  has_many :commented_images, through: :comments, source: :image
  has_many :likes
  has_many :liked_images, through: :likes, source: :image

  def has_liked?(image)
    liked_images.include?(image)
  end

end
