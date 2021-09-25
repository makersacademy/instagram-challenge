class Comment < ApplicationRecord
  belongs_to :instapost
  acts_as_votable
end
