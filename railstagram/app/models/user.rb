class User < ApplicationRecord
  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable,  and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :registerable, :validatable
end
