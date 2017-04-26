class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  validates :user, uniqueness: { scope: :post}
end
