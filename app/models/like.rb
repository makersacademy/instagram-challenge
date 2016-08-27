class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :photo
  # validates :user, uniqueness: { scope: :photo, message: 'You have already liked this photo'}
  validates_uniqueness_of :user, scope: :photo
end
