class Pic < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true, length: { minimum: 1 }
  validates :description, presence: true, length: { minimum: 1 }
end
