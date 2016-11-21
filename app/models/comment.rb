class Comment < ApplicationRecord

  validates :rating, inclusion: (1..5)

end
