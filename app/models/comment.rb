class Comment < ApplicationRecord
  belongs_to :post
  acts_as_votable
end
