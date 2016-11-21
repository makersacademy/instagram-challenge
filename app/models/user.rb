class User < ApplicationRecord
  has_many :pictures
  has_many :likes
  has_many :liked_pictures, through: :likes, source: :pictures

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
