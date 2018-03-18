class Comment < ApplicationRecord
  belongs_to :post

  validates :user, presence: true
  validates :body, presence: true
end
