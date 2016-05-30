class Iron < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates :user, uniqueness: { scope: :post, message: "you have ironed this post already" }

end
