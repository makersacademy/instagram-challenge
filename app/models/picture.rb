class Picture < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  validates :url, presence: true
end
