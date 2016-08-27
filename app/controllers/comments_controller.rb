class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.build_comment(comment_params, current_user)
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
