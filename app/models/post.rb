class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  acts_as_votable
end
