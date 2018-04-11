class Picture < ApplicationRecord
  validates_presence_of :link, :description

  # belongs_to :user, optional: true
  belongs_to :user
  has_many :comments
  has_many :likes
end
