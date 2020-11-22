class PostsController < ApplicationController

  def index
    if (!current_user)
      redirect_to sign_in_url
    end
    @comment = Comment.new
    @posts = Post.all.sort_by{ |post| post[:created_at] }.reverse
  end

  def comment_new
    comment = Comment.create!(comment_params)
    redirect_to posts_url
  end

  def comment_destroy
    Comment.find(params[:format]).destroy
    redirect_to posts_url
  end

  def new
    @post = Post.new
    @user_id = current_user.id
  end

  def create
    post = Post.create!(post_params)
    redirect_to posts_url
  end

  def destroy
    Comment.where("post_id = ?", params[:format]).each {|comment| comment.destroy}
    @post = Post.find(params[:format])
    @post.destroy
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:image, :user_id)
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end

end
