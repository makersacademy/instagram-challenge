class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  def new
    @post = Post.find(params[:post_id])
    @user = current_user
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @user = current_user
    @post.reviews.create(review_params)
    redirect_to posts_path
  end

  def review_params
    params.require(:review).permit(:comment)
  end

end
