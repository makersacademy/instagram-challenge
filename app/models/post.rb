class Post < ApplicationRecord

  validates :caption, presence: true

  has_one_attached :image

  belongs_to :user

end
