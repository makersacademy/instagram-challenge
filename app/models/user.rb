class User < ApplicationRecord

  has_many :posts, dependent: :destroy

  validates :user_name, presence: true, length: { minimum: 5, maximum: 20 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
