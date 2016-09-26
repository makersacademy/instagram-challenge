class User < ActiveRecord::Base
  include WithUserAssociationExtension
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, :presence => true, :uniqueness => { :case_sensitive => false }
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  has_many :pictures, -> { extending WithUserAssociationExtension }, dependent: :destroy
  has_many :comments
  has_many :commented_pictures, through: :comments, source: :picture
  has_many :likes
  has_many :liked_pictures, through: :likes, source: :picture

  def has_commented?(picture)
    commented_pictures.include? picture
  end

  def has_liked?(picture)
    liked_pictures.include? picture
  end
end
