class Gallery < ApplicationRecord
  has_many :pictures, dependent: :destroy
  belongs_to :user
  validates :name, length: { minimum: 1, maximum: 30 }, uniqueness: true
end
