class Photo < ApplicationRecord
  has_many :likes, dependent: :destroy

end
