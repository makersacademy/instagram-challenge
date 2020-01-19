class User < ApplicationRecord
  include Clearance::User
  has_many :fatcats, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end
