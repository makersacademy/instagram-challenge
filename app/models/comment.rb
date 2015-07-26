class Comment < ActiveRecord::Base

  belongs_to :picture

  validates :comment, presence: true

end
