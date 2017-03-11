class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :user, uniqueness: { scope: :post, message: "has liked this post already" }
end
