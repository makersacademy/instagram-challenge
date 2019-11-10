class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_param)
    redirect_to '/'
  end

  private
  def comment_param
    new_params = params.require(:comment).permit(:message)
    new_params.merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
