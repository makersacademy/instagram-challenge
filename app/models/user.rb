# frozen_string_literal: true

# User
class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent:
  acts_as_commontator
  acts_as_voter
end
