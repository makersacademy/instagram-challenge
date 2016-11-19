class Picture < ApplicationRecord
  validates :description, presence: true
  validates :user, presence:true

  belongs_to :user
  has_many :comments
  has_many :likes
end
