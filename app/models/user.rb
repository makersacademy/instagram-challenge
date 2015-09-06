class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :likes
  has_many :pictures, dependent: :destroy
  has_many :comments
  has_many :liked_pictures, through: :likes, source: :pictures

  def has_liked?(picture)
    liked_pictures.include?(picture)
  end
  
end
