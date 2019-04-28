class Pic < ApplicationRecord
  has_many :comments
  has_one_attached :image
end
