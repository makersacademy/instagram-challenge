class Comment < ActiveRecord::Base

  belongs_to :photo
  belongs_to :user

  validates_presence_of :words

end
