class Post < ApplicationRecord
  has_one_attached :photo
  validates :message, presence: true,
                      length: { minimum: 3 }
end
