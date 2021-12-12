class Comment < ApplicationRecord
  belongs_to :post

  validates :comment, presence: true
end
