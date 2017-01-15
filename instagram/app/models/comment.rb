class Comment < ApplicationRecord
  validates :thoughts, presence: true
end
