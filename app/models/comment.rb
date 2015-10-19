class Comment < ActiveRecord::Base
  validates :comment, presence: true
  belongs_to :user
  belongs_to :post
end
