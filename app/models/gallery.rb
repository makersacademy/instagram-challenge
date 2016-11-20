class Gallery < ApplicationRecord
  validates :name, length: { minimum: 1, maximum: 30 }, uniqueness: true
  has_many :pictures, dependent: :destroy
end
