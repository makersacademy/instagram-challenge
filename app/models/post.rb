class Post < ApplicationRecord
  validates :description, presence: true
end
