class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @posts = Post.find(params[:post_id])
    @comments = Comment.new
  end

  def create
    @posts = Post.find(params[:post_id])
    @comments = @posts.comments.build_with_user(comment_params, current_user)
    if @comments.save
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
