class PostsController < ApplicationController
  def index
    @posts = Post.all.reverse
    @like = Like.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:success] = "Your post has been created."
      redirect_to posts_url
    else
      flash[:alert] = "You need an image to create a post."
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end
end
