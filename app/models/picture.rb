class Picture < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :user_id, presence: true
  validates :title, presence: true, length: { minimum: 1 }
  validates :caption, presence: true, length: { maximum: 140 }
end
