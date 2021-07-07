class Image < ApplicationRecord
  has_one_attached :pic
  has_many :tweetts
  belongs_to :user
end
