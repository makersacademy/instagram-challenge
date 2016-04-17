class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :moments
  has_many :commented_moments, through: :comments, source: :moments

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



end
