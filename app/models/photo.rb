class Photo < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, length: { minimum: 3 }
end
