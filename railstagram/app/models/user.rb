class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable,  and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :confirmable, :registerable, :validatable
end
