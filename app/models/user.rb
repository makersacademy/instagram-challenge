  class User < ApplicationRecord

  has_many :contributions
  has_many :comments
  has_many :commented_contributions, through: :comments, source: :contribution
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
