class User < ApplicationRecord
  attr_accessor :name, :email

  validates :name, presence: true
end
