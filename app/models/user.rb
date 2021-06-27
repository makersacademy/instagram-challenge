class User < ApplicationRecord
  has_many :bamposts
  validates :name, presence: true
  validates :email, presence: true
end
