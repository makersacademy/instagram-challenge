class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :pictures
  has_many :comments
  has_many :likes
  has_many :liked_pictures, through: :likes, source: :picture

  def has_liked?(picture)
    liked_pictures.include? picture 
  end

end
