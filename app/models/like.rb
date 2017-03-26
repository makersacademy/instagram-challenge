class Like < ApplicationRecord
  belongs_to :photograph
  belongs_to :user

  validates :user, uniqueness: { scope: :photograph, message: "has liked this post already"}

end
