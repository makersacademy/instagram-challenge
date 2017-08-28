class User < ApplicationRecord
  has_many :posts

  validates :user_name, presence: true, length: { minimum: 6, maximum: 16 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
