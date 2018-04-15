class Post < ApplicationRecord
  validates :photo, presence: true
  validates :desc, presence: true
end
