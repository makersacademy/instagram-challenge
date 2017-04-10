class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :pictures
  has_many :commented_pictures, through: :comments, source: :picture
  has_many :liked_pictures, through: :likes, source: :picture

  def has_liked?(picture)
    liked_pictures.include? picture
  end


  def has_commented_on?(picture)
    commented_pictures.include? picture
  end

  def owns?(picture)
    picture.user_id == id
  end
end
