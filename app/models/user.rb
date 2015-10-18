class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :photos
  has_many :comments
  has_many :commented_photos, through: :comments, source: :photo

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
