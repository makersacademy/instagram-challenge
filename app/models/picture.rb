class Picture < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user, dependent: :destroy
  
  validates :name, length: { minimum: 2 }, uniqueness: true
end
