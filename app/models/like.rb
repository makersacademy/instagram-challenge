class Like < ApplicationRecord
  belongs_to :post
  belongs_to :account
  validates_uniqueness_of :post_id, scope: :account_id
end