class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  validates :opinions, length: { minimum: 3 }
end
