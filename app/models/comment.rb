class Comment < ActiveRecord::Base
  belongs_to :post
  validates :opinions, length: { minimum: 3 }
end
