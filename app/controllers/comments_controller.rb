class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @post.comments.create(comment_params)
    redirect_to posts_path
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy_as_user(current_user)
      redirect_to posts_path
    else
      flash[:notice] = 'Only the user who commented can delete this comment'
      redirect_to posts_path
    end
  end

  def comment_params
    params.require(:comment).permit(:thoughts)
  end
end
