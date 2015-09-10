class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :user_name, presence: true, length: { minimum: 4, maximum: 10 }

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  acts_as_voter
end
