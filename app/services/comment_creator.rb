class CommentCreator < ActiveRecord::Base
  def initialize(params, current_user)
    @params = params
    @current_user = current_user
  end

  def create_comment
    check if current_user exists
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.build_with_user(comment_params, current_user)
    @comment.save
  end
end
