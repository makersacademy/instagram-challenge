class User < ApplicationRecord
  has_many :instapics, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :nickname
  validates_uniqueness_of :nickname

end
