class Tag < ApplicationRecord
  has_many :pictures, through: :filters
  has_many :filters
end
