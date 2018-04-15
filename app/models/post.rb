class Post < ApplicationRecord
  belongs_to :user
  validates :caption, presence: true,
                    length: { minimum: 1 }
end
