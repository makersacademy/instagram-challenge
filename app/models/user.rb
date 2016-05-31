class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :user_name, presence: true, length: { minimum: 3, maximum: 30 }

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
end
