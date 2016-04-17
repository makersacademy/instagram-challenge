class Image < ActiveRecord::Base
  validates :title, length: {maximum: 50}
end
