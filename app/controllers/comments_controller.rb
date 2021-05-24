class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @user = User.find_by(params[:user_id])
    @post = Post.find_by(id: params[:format])
  end

  def create
    @comment = Comment.create(comments_params)
    redirect_to posts_path
  end

  private

  def comments_params
    params.require(:comment).permit(:body, :post_id, :user_id)
  end
end
