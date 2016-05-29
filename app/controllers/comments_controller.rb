class CommentsController < ApplicationController

  before_action :authenticate_user!

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    Comment.create(comment_params)
    redirect_to posts_path
  end

  def comment_params
    user_and_post = {user: current_user, post: Post.find(params[:post_id])}
    params.require(:comment).permit(:content).merge(user_and_post)
  end

end
