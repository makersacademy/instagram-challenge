class Comment < ActiveRecord::Base
  validates :thoughts, length: { minimum: 3 }
end
