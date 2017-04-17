class Like < ActiveRecord::Base
  belongs_to :picture
  belongs_to :user
  validates :user, uniqueness: { scope: :picture, message: "user has already liked this picture" }
end
