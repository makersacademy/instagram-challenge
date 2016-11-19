class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :post

  validates :user, uniqueness: { scope: :post, message: "has commented on this post already" }

end
