class Comment < ApplicationRecord
  belongs_to :turtlegram
  belongs_to :user
end
