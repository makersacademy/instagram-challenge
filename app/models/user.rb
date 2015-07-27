class User < ActiveRecord::Base
  has_many :pictures
  has_many :comments
  has_many :likes

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
