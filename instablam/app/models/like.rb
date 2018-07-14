class Like < ApplicationRecord
  belongs_to :picture
  belongs_to :user

  validates :user_id, uniqueness: { scope: :picture_id }
end
