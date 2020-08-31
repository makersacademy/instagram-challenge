class User < ApplicationRecord
  has_many :posts
  has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable,  and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :registerable, :validatable
  
end
