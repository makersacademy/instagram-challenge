class PostsController < ApplicationController
  
  def index
    @posts = Post.order( created_at: :desc )
  end

  def new
    @posts = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:image, :description)
  end

end
