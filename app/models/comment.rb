class Comment < ActiveRecord::Base
  belongs_to :post
  validates :rating, inclusion: (1..10)
end
