class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :photo

  def self.add_comment(user, photo, params)
    comment = self.new(params)
    user.comments << comment
    photo.comments << comment
    comment.save
    return comment
  end  
end
