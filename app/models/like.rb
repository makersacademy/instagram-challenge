class Like < ApplicationRecord
  belongs_to :post
  # belongs_to :user why doesn't this line work!!
end
