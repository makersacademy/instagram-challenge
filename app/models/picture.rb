class Picture < ApplicationRecord
  validates :url, presence: true
end
