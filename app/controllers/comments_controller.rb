class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end


  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create_with_user(comment_params, current_user)
    redirect_to '/posts'
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
