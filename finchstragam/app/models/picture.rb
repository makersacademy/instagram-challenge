class Picture < ApplicationRecord
  validates_presence_of :link, :description
end
