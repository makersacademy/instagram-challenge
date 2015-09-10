class User < ActiveRecord::Base

  has_many :photos, dependent: :destroy

  has_many :comments

  has_many :commented_photos, through: :comments, source: :photo

  validates :username, presence: true, allow_blank: false, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
