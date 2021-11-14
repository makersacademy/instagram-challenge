class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :comments
  validates :username, presence: true
  has_one_attached :avatar
  validates :avatar, attached: true, 
                     content_type: ['image/png', 'image/jpg', 'image/jpeg'], 
                     size: { less_than: 10.megabytes, message: 'is too big' }
end
