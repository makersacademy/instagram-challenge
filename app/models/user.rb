class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :photographs
  has_many :comments
  has_many :commented_photographs, through: :comments, source: :photograph

  def has_commented?(photograph)
    commented_photographs.include? photograph
  end

end
