class Like < ApplicationRecord
  belongs_to :user_id
  belongs_to :post_id
  belongs_to :comment_id
end
