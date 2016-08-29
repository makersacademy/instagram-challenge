class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :photographs
  has_many :comments
  has_many :commented_photographs, through: :comments, source: :photograph
  has_many :liked_photographs, through: :likes, source: :photograph

  def has_commented?(photograph)
    commented_photographs.include? photograph
  end

  def has_like?(photograph)
    liked_photographs.include? photograph
  end

end
