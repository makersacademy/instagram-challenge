class Post < ApplicationRecord

  has_many :comments
  validates :photo, presence: true
  validates :description, presence: true,
                          length: { minimum: 5 }

end
