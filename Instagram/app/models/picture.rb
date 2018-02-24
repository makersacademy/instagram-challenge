class Picture < ApplicationRecord
  validates :name_of_picture, presence: true,
                  length: { minimum: 5 }
end
