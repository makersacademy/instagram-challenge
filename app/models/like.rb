class Like < ApplicationRecord
  belongs_to :picture

  validates :picture_id, presence: true
end
