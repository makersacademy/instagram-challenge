class CommentsController < ApplicationController
  before_action :set_post
  before_action :owned_comment, only: :destroy

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      flash[:success] = "Comment added!"
      redirect_to root_path
    else
      flash[:alert] = "Check the comment form, something went horribly wrong."
      render root_path
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])

    @comment.destroy
    flash[:success] = "Comment deleted"
    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def owned_comment
    @comment = @post.comments.find(params[:id])
    unless @comment.user_id == current_user.id
      flash[:alert] = "Unable to remove other users comments"
      redirect_to root_path
    end
  end
end
