class Post < ApplicationRecord

  validates :caption, length: { minimum: 3 }
  has_many :comments, dependent: :destroy

end
