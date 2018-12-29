class Post < ApplicationRecord

  validates :caption, presence: true

  has_one_attached :image

end
