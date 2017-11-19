class Pin < ApplicationRecord
  acts_as_votable
  belongs_to :user
  validates :image, presence: true
  validates :caption, presence: true, length: { maximum: 16}
  has_many :comments, dependent: :destroy
end
