class Picture < ApplicationRecord
  has_many :comments
  validates :url, :format => URI::regexp(%w(http https))
end
