class Comment < ApplicationRecord
  belongs_to :pic
  validates :thoughts, presence: true
end
