class Comment < ActiveRecord::Base
  belongs_to :photo
  belongs_to :user
  validates_length_of :comment, maximum: 255
  validates_presence_of :comment
end
