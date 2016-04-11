class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create_with_user comment_params, current_user
    redirect_to @post
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if current_user.id == @comment.user_id
      @comment.destroy
      redirect_to @post 
    else
      redirect @post 
    end
  end

  private 

  def comment_params
    params.require(:comment).permit(:body)
  end
end
