class User < ApplicationRecord
include ImageUploader::Attachment(:image)
has_secure_password
  has_many :posts
  has_many :comments
  has_many :likes
validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "Invalid email" }
validates_presence_of :first_name, :last_name, :date_of_birth
end
