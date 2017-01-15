class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :pictures
  has_many :comments
  has_many :likes

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
