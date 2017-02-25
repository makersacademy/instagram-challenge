class User < ApplicationRecord
  has_many :instapics, dependent: :destroy
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


end
