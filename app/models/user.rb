class User < ApplicationRecord
  has_many :posts
  has_many :likes

  validates_uniqueness_of :username
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
