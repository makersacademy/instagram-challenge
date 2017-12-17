class Post < ApplicationRecord
  validates :text, presence: true,
            length: { maximum: 2200 }
end
