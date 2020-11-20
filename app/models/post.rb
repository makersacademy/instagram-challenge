class Post < ApplicationRecord
  validates_presence_of :image
  belongs_to :user
end
