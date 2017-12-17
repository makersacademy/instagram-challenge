class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :text, presence: true,
            length: { maximum: 2200 }
end
