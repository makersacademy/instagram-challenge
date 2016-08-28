class User < ActiveRecord::Base

  has_many :posts, dependent: :destroy

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
