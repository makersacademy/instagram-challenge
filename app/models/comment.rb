class Comment < ActiveRecord::Base
  belongs_to :post
  validates :thoughts, length: { minimum: 3 }
end
