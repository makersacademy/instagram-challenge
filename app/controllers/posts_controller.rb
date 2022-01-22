class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_url
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  
  def post_params
    params.require(:post).permit(:body)
  end
end
