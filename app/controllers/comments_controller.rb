class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
    redirect_to posts_url
  end

  private

  def comment_params
    new_params = params.require(:comment).permit(:body)
    new_params.merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
