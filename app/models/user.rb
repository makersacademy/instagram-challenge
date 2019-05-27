class User < ApplicationRecord
  has_many :posts

  has_many :comments, dependent: :destroy

  has_many :likes

  validates :user_name, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
