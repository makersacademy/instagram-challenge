class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :account
  validates_presence_of :content
  validates_presence_of :account_id
  validates_presence_of :post_id
end
