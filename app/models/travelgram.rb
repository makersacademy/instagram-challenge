class Travelgram < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :name, length: {minimum: 3}
end
