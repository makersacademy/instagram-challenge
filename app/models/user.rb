class User < ApplicationRecord
  include Clearance::User
  validates :username, presence: true, length: { minimum: 4, maximum: 20 }
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
end
