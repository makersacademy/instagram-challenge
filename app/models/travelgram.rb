class Travelgram < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :name, length: {minimum: 3}, uniqueness: true
end
