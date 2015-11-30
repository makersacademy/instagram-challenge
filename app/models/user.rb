class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  
  has_many :likes
  has_many :filterspams
  has_many :liked_filterspams, through: :likes, source: :filterspam
end
