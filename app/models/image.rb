class Image < ApplicationRecord

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end
