class User < ApplicationRecord
  acts_as_voter
  has_many :snaps # just added
  include Clearance::User
  has_many :comments
end
