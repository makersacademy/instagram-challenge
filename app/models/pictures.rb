class Pictures < ApplicationRecord
  validates_presence_of :link
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end
