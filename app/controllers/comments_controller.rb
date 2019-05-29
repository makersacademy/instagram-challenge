class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(content: comment_params["content"], user_id: current_user.id)
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    flash[:success] = "Comment deleted"
    redirect_to posts_path
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end
  end
