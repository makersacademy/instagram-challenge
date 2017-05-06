class Picture < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates_format_of :url, :with => URI::regexp(%w(http https))
end
