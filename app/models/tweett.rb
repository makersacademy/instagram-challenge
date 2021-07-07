class Tweett < ApplicationRecord
  belongs_to :image
  has_one_attached :pic
end
