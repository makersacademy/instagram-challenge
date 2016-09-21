class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :photograph
  has_many :commented_photographs, through: :comments, source: :photograph
  validates :user_id, uniqueness: { scope: :photograph, message: "has reviewed this restaurant already" }
end
