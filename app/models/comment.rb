class Comment < ApplicationRecord

  belongs_to :post

  validates :content, length: { maximum: 200 }
  
end
