class PostsController < ApplicationController
  def index
    @posts = Post.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_url
    else
      render "new"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post
      @post.destroy
      redirect_to posts_url
    else
      redirect_to posts_url
    end
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end
end
