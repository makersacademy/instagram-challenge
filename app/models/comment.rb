class Comment < ApplicationRecord
  validates_length_of :comment, :maximum => 140
end
