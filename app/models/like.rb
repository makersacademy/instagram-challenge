class Like < ApplicationRecord
  include ActiveModel::Validations
  belongs_to :post
  belongs_to :user

  validates_with LikeValidator
  validates :user, uniqueness: { scope: :post, message: "You can only like a post once" }
end
