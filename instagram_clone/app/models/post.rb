class Post < ApplicationRecord
  validates :title, length: { minimum: 3 }, uniqueness: true
  has_many :comments, dependent: :destroy

end
