class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, length: { minimum: 6 }

  has_many :pictures, dependent: :destroy
  has_many :comments
  has_many :commented_pictures, through: :comments, source: :picture

  def owns?(picture)
    pictures.include? picture
  end

end
