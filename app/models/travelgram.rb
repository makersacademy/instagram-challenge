class Travelgram < ApplicationRecord
  has_many :comments, dependent: :destroy
end
