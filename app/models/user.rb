class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  has_many :posts, dependent: :destroy
  has_many :comments
  has_many :commented_posts, through: :comments, source: :post
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
