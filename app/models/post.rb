class Post < ApplicationRecord

  has_many :comments, dependent: :destroy

  validates :title, length: { maximum: 50 }
  validates :description, length: { maximum: 200 }

end
