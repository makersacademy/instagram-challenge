class Post < ApplicationRecord

  validates :photo, presence: true
  validates :description, presence: true,
                          length: { minimum: 5 }

end
