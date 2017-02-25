class Like < ApplicationRecord
  belongs_to :post, dependent: :destroy
end
