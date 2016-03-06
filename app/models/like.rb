class Like < ActiveRecord::Base
  belongs_to :photo
  belongs_to :user
  validates_uniqueness_of :user_id, :scope => [:photo_id]

end
