class Comment < ActiveRecord::Base

  belongs_to :photo

  validates :thoughts, length: {minimum: 1}

end
