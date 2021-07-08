class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	has_many :posts
	has_many :comments
	has_many :likes

	validates :bio, length: { maximum: 150, too_long: "150 characters is the maximum allowed" }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
