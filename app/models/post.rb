class Post < ApplicationRecord
  has_many :comments
  validates :text, presence: true,
            length: { maximum: 2200 }
end
