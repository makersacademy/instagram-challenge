class Comment < ApplicationRecord
  belongs_to :picture

  validates_presence_of :comment
end
