class Post < ApplicationRecord
  validates :image_data, presence: true
end
