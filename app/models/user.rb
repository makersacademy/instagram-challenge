class User < ApplicationRecord
  before_save { self.email = email.downcase }

  VALID_NAME_REGEX = /\A[a-z ,.'-]+\z/i
  validates :name, presence: true, length: { maximum: 25 },
                    format: { with: VALID_NAME_REGEX }

  VALID_USERNAME_REGEX = /\A[a-z0-9_]*\z/i
  validates :username, presence: true, length: { maximum: 15 },
                    format: { with: VALID_USERNAME_REGEX },
                    uniqueness: { case_sensitive: false }

  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
