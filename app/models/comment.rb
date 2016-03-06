class Comment < ActiveRecord::Base
  belongs_to :user
  delegate :username, to: :user
  belongs_to :post
end
