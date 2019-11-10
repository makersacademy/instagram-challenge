class Pic < ApplicationRecord
  belongs_to :user
  has_many :comments, :as => :commentable, :dependent => :destroy
  acts_as_votable
  acts_as_commentable
end
