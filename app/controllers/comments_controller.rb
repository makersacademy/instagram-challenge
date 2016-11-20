class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    comment.post_id = params[:post_id]
    comment.save
    redirect_to post_path(comment.post_id)
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
