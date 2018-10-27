class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates_presence_of :body, length: { minimum: 1 }
end
