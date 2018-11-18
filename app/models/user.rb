class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :images
  has_many :likes, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
end
