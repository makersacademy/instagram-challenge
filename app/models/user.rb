class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :pics
  has_many :comments, :dependent => :destroy
  acts_as_voter
end
