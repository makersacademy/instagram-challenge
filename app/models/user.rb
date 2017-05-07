class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :turtlegrams, dependent: :destroy
  has_many :commented_turtlegrams, through: :comments, source: :turtlegram

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
