class Picture < ApplicationRecord
  validates_presence_of :pic, :description
end
