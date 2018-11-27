class Post < ApplicationRecord
  belongs_to :user
  hans_many :photos
end
