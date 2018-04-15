class Post < ApplicationRecord
  validates :caption, presence: true,
                    length: { minimum: 1 }
end
