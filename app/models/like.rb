class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user
  # self.primary_key = 'user_id,post_id'
  validates :user_id, :post_id, uniqueness: true
end
