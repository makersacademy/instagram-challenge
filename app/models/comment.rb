class Comment < ApplicationRecord

  validates :comment, length: { minimum: 1 }

end
