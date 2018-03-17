class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :photos
  has_many :likes

  validates :username, presence: true

  attr_accessor :login

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
