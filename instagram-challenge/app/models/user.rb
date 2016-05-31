class User < ActiveRecord::Base
  has_many :likes
  has_many :comments
  has_many :pictures
  has_many :liked_pictures, through: :likes, source: :picture
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

  def has_liked?(picture)
    liked_pictures.include?(picture)
  end
end
