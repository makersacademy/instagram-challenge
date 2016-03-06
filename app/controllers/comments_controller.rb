class CommentsController < ApplicationController
  # before_action :authenticate_user!, :except => [:index, :show]

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
