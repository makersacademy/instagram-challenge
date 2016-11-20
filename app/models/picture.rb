class Picture < ApplicationRecord
  belongs_to :user
  belongs_to :gallery
  validates :title, length: { minimum: 1, maximum: 30 }, uniqueness: true

end
