class PostsController < ApplicationController

  def index
    @posts = Post.all.sort_by{ |post| post[:created_at] }.reverse
  end

  def new
    @post = Post.new
    @user_id = current_user.id
  end

  def create
    post = Post.create!(post_params)
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:image)
  end

end
