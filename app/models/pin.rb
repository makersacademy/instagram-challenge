class Pin < ApplicationRecord
  belongs_to :user 
  validates :image, presence: true
end
