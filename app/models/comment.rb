class Comment < ActiveRecord::Base
  belongs_to :image
  belongs_to :user

  def self.save_new_with_current_user(image_id,comment_params, current_user)
    image = Image.find(image_id)
    comment = image.comments.create(comment_params)
    self.save_user_id(current_user,comment)
  end

  def self.delete(id)
    comment = Comment.find(id)
    comment.destroy
  end

  private

  def self.save_user_id(current_user, comment)
    comment.user_id = current_user.id
    comment.save
  end
end
