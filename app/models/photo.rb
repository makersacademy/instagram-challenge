class Photo < ApplicationRecord

  validates :description, length: { minimum: 1}

end
