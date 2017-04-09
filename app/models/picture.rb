class Picture < ActiveRecord::Base
  acts_as_votable
  has_many :comments, dependent: :destroy
end
