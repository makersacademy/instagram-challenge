class User < ActiveRecord::Base
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
