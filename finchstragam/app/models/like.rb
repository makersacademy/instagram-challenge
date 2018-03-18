class Like < ApplicationRecord
  belongs_to :user
  belongs_to :picture

  validates_presence_of :number_of_likes
end
