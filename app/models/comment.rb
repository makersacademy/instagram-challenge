class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :thoughts, presence: true
end
