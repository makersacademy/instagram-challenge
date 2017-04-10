class User < ApplicationRecord
  acts_as_voter
  validates :username, presence: true, length: { minimum: 4, maximum: 16 }

  has_many :posts, dependent: :destroy
  has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

end
