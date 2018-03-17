class Picture < ApplicationRecord

  has_many :comments

  validates :title, presence: true
  validates :picture_url, presence: true
end
