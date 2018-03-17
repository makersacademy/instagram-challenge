class Picture < ApplicationRecord

  validates :title, presence: true
  validates :picture_url, presence: true
end
