class User < ApplicationRecord
  has_secure_password
  has_many :likes, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validate :password_length

  def password_length
    return if password.length > 5 && password.length < 11
    errors.add :password, 'password must be between 6 and 10 characters'
  end
end
