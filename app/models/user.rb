class User < ApplicationRecord
  has_many :posts, dependent: :destroy #when user is deleted post is deleted as well

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence:true, length: {maximum: 50}
end
