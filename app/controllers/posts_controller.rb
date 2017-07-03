class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Success!"
      redirect_to posts_url(@post)
    else
      flash[:error] = @post.errors.full_messages
      redirect_to new_post_url
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:image, :description)
  end
  
end
