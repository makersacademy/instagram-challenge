class Gif < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :generator, presence: true, allow_blank: false
end
