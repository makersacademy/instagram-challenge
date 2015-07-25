class Comment < ActiveRecord::Base
  belongs_to :photo
  validates :photo_id, :presence => true
end
