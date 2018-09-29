class PostsController < ApplicationController
  
  def index
    @posts = Post.order( created_at: :desc )
  end

  def new
    @posts = Post.new
  end

  def create
    @post = Post.create(image: post_params[:image], description: post_params[:description], user: current_user)
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:image, :description)
  end

end
