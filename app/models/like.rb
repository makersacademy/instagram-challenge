class Like < ActiveRecord::Base

  belongs_to :user
  belongs_to :image
  validates :user, uniqueness: { scope: :image }

end
