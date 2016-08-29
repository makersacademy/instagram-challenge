class User < ActiveRecord::Base

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  has_many :comments, dependent: :destroy
  has_many :commented_posts, through: :comments, source: :post

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  validates :username, uniqueness: true
  validates :email, uniqueness: true

  def email_required?
    false
  end

  def email_changed?
    false
  end
  
end
