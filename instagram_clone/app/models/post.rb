class Post < ApplicationRecord
  validates :title, length: { minimum: 3 }, uniqueness: true
  belongs_to :user
  has_many :comments, dependent: :destroy

end
