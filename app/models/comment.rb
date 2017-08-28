class Comment < ApplicationRecord
  belongs_to :post
  validates :text, presence: true,
                   length: { minimum: 2 }
end
