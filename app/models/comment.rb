class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :photograph
  validates :user_id, uniqueness: { scope: :restaurant, message: "has reviewed this restaurant already" }
end
