class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def edit
  end

  def create
    post = Post.find(params[:post_id])
    post.comments.create(comment_params)
    redirect_to post_path(post)
  end

  def update
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(user: current_user)
  end
end
