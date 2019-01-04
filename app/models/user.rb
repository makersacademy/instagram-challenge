class User < ApplicationRecord

  attr_accessor :password
  before_save :encrypt_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true, length: { in: 6..20 }
  validates :password, confirmation: { case_sensitive: true }

  validates_uniqueness_of :email

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
