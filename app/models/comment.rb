class Comment < ApplicationRecord
  validates :body, presence: true
  validates :user_id, presence: true
  validates :post_id, presence: true
end
