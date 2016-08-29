class Comment < ApplicationRecord

  belongs_to :post
  belongs_to :user

  validates :content, length: { maximum: 200 }

end
