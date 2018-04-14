class Picture < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :imgURL, presence: true, :format => URI::regexp(%w(http https))
  validates :description, presence: true, length: { minimum: 5 }
end
