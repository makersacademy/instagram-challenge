class CommentsController < ApplicationController

  before_action :authenticate_user!
  
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build_with_user(comment_params, current_user)
    if @comment.save
      redirect_to '/posts'
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
