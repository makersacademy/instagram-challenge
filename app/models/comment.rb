class Comment < ActiveRecord::Base

  belongs_to :picture
  has_many :likes

end
