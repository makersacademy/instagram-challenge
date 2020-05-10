class User < ApplicationRecord
  attr_accessor :remember_token

  before_validation { self.email = self.email.downcase }
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\S*@[a-z]*\.[a-z]{2,30}([a-z]|\.[a-z]{2,30})/i
  validates :email, presence: true, 
            format: {with:  VALID_EMAIL_REGEX },
            uniqueness: true
  has_secure_password
  validates :password, presence: true, length: {minimum: 5 }


#Returns the hash digest of the given string
# the digest method does not need an instance of the object so it made into a class method 
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST: BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end 

  #Returns a random taken 
  def self.new_token
    SecureRandom.urlsafe_base64
  end 

  def remember 
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end 
end 