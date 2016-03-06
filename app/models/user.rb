class User < ActiveRecord::Base

  has_many :posts, dependent: :destroy

  validates :username, length: {minimum: 4}, uniqueness: true, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
