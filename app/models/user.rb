class User < ActiveRecord::Base
  has_many :images, :dependent => :destroy
  validates :name, :username, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
