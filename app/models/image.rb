class Image < ApplicationRecord
  has_one_attached :picture
  belongs_to :user
end
