class Like < ApplicationRecord
  belongs_to :picture
  belongs_to :user
  validates_uniqueness_of :user_id, scope: :picture_id
end
