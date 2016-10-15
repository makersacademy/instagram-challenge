class User < ApplicationRecord

  has_many :photos, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

end
