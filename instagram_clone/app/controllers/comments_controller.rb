class CommentsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @post.comments.create(comment_params)
    redirect_to '/posts'
  end

  def comment_params
    params.require(:comment).permit(:thoughts)
  end

  def destroy
    @comment = Comment.find(params[:id])
      @comment.destroy
      flash[:notice] = 'comment deleted successfully'
      redirect_to "/posts"
  end

end
