class Picture < ApplicationRecord
  has_many :comments
  validates :name_of_picture, presence: true,
                  length: { minimum: 5 }
end
