class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :pictures, dependent: :destroy, dependent: :restrict_with_error
  has_many :comments, dependent: :destroy, dependent: :restrict_with_error

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


end
