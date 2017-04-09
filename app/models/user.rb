class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :photos, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy


end
