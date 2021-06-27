class Bampost < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  has_one_attached :image
end
