
class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :woofs, dependent: :destroy
  validates :title, uniqueness: true
end
