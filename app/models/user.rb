class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :comments
  has_many :pictures
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
