class Picture < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :name, length: { minimum: 2 }, uniqueness: true
end
