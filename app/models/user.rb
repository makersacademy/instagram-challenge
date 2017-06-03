class User < ApplicationRecord
  has_secure_password
  validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { message: "that email address is taken" }
end
