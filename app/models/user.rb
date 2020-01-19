class User < ApplicationRecord
  include Clearance::User
  has_many :fatcats
  has_many :comments
end
