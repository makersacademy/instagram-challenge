class Comment < ActiveRecord::Base

  belongs_to :post
  belongs_to :user

  validates_presence_of :comments

end
