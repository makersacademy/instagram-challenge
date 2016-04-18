class Like < ActiveRecord::Base
  belongs_to :photo
  belongs_to :user
  validates :user, uniqueness: { scope: :photo }
end
