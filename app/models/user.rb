class User < ActiveRecord::Base

  has_many :pictures

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
