class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  acts_as_votable
  has_many :likes, dependent: :destroy
  has_many :liked_by, :through => :likes, :source => :user
end
