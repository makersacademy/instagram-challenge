class User < ActiveRecord::Base
  has_many :images
  validates :name, :username, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
