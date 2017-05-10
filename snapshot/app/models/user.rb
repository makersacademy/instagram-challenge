class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  # Validates that username is between 4 and 20 characters
  validates :user_name, presence: true, length: { minimum: 4, maximum: 30 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
