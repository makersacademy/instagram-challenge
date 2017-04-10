class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates_length_of :content, :maximum => 140
  serialize :comment
end
