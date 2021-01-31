class Image < ApplicationRecord
  has_many :tweetts
  belongs_to :user
end
