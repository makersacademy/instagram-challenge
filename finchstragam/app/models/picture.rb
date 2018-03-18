class Picture < ApplicationRecord
  validates_presence_of :link, :description

  has_many :comments
end
