class Comment < ActiveRecord::Base

  belongs_to :picture
  belongs_to :user

  validates :description, length: {maximum: 140}

end
