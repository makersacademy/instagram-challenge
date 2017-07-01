class User < ApplicationRecord
  include Clearance::User
  has_many :photos
  has_many :comments
end
