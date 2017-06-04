class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @post = Comment.create(comment_params)
    redirect_to '/posts'
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to '/posts'
  end

  private

  def comment_params
    params
      .require(:comment)
      .permit(:body, :user_id)
      .merge(post_id: params[:post_id])
  end
end
