class Picture < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  validates :user_id, presence: true
  

end
