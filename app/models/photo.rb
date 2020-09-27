class Photo < ApplicationRecord
  has_one_attached :photo
  validates :photo, presence: true 
  has_one :user
end
