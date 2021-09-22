class CommentsController < ApplicationController
  def create
    redirect_to home_url unless session[:user_id]
    @comment = Comment.new(post_params)
    @comment.save
    redirect_to posts_path
  end

  private def post_params
    params.require(:comment).permit(:entry, :post_id, :user_id)
  end
end
