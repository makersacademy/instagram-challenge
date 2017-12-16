class Image < ApplicationRecord
  has_many :reactions
  has_many :likes
end
