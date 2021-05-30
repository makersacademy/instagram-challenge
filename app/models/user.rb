class User < ApplicationRecord
  validates :username, presence: true, length: { minimum: 4, maximum: 16 }
  has_many :posts, dependent: :destroy

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
end
