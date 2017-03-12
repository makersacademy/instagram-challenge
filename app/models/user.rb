class User < ApplicationRecord
  has_many :posts
  has_many :comments

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
