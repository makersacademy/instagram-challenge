class User < ActiveRecord::Base
  has_many :photos
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
