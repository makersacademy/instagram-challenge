class Like < ApplicationRecord
  belongs_to :user
  belongs_to :photo

  validates_uniqueness_of :user_id, scope: :photo_id
end
