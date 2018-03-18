class Picture < ApplicationRecord
  validates_presence_of :link, :description

  belongs_to :user, optional: true
  has_many :comments
  has_many :likes
end
