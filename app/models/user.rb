class User < ApplicationRecord
  has_many :experiences
  has_many :comments

  validates :username, uniqueness: true, presence: true


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
