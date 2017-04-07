class User < ApplicationRecord
  has_many :instapics, dependent: :destroy
  # has_many :likes
  has_many :liked_instapics, through: :likes, source: :instapic

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :nickname
  validates_uniqueness_of :nickname

end
