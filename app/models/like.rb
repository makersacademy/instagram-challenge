class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :user, uniqueness: { scope: :post_id }
end
