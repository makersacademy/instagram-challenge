class Gallery < ApplicationRecord
  validates :name, length: { minimum: 1, maximum: 30 }, uniqueness: true
end
