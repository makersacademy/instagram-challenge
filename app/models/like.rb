class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :user, uniqueness: { scope: :post, message: "You can only like a post once" }
end
