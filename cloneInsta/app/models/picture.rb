class Picture < ApplicationRecord
  validates :url, :format => URI::regexp(%w(http https))
end
