class Comment < ApplicationRecord
  belongs_to :post, dependent: :destroy

  validates :body, length: { minimum: 1 }
end
