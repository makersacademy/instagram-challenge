class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :pictures, dependent: :destroy
  has_many :filters
  has_many :tags, through: :filters

  validates :username, presence: true, uniqueness: true, length: { maximum: 50 }

end
