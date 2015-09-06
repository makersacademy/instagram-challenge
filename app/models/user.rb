class User < ActiveRecord::Base
  has_many :comments
  has_many :commented_images, through: :comments, source: :image
  has_many :images, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
