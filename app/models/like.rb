class Like < ActiveRecord::Base
  belongs_to :picture
  belongs_to :user

  validates :user_id, uniqueness: { scope: :picture_id }
end
