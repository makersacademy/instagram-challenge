class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :pictures
  has_many :comments
  has_many :commented_pictures, through: :comments, source: :picture

  def has_commented?(picture) 
    commented_pictures.include? picture
  end

end
