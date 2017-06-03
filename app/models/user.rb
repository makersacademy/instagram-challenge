class User < ApplicationRecord
  include Clearance::User
  validates_presence_of :name, :username
end
