class Comment < ApplicationRecord
  belongs_to :picture

  validates :picture_id, presence: true
  validates :content, presence: true, length: { maximum: 100 }
end
