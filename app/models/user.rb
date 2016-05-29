class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true, length: { minimum: 4, maximum: 16 }
end
