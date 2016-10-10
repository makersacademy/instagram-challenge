class Like < ApplicationRecord

  has_one :post
  belongs_to :user

  validates :user_id, uniqueness: { scope: :post_id, message: "You have already liked this post" }

end
