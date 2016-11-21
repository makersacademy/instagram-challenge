class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :comments
  has_many :pictures
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :user, uniqueness: { scope: :picture, message: "has liked this picture already" }

  # def has_liked?(picture)
  #   liked_pictures.include? picture
  # end

end
