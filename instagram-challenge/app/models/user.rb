class User < ActiveRecord::Base
  has_many :pictures, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :commented_pictures, through: :comments, source: :picture
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
