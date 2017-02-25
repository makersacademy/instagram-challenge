class Comment < ApplicationRecord
  belongs_to :post, dependent: :destroy
end
