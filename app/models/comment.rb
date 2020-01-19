class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  delegate :username, :to => :user, :prefix => 'author'
end
