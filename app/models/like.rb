class Like < ApplicationRecord

  belongs_to :user, dependent: :destroy
  belongs_to :post, dependent: :destroy
  validates :user, uniqueness: { scope: :post, message: "has liked this post already" }

end
