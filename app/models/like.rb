class Like < ApplicationRecord

  belongs_to :user
  belongs_to :post
  validates :user, uniqueness: { scope: :post, message: "has liked this post already" }

end
