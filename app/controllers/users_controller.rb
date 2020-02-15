class UsersController < ApplicationController
  has_many :posts
  validates :email, presence: true,
                    length: { minimum: 5 }
end
