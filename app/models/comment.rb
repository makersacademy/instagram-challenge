class Comment < ActiveRecord::Base
  validates :thoughts, length: { minimum: 3 }
  belongs_to :post
  belongs_to :user

end
