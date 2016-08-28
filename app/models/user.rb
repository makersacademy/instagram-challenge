class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :posts
  has_many :likes
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
