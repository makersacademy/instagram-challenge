class Comment < ApplicationRecord

  has_one :post
  belongs_to :user

end
