class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @posts = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Your post has been created!"
      redirect_to @post
    else
      flash[:alert] = "Error: you must add an image to post"
      redirect_to new_post_path
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end
end
