class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create

    @user = current_user
    @post = @user.posts.new(post_params)

    if @post.save
      redirect_to root_path
    else
      flash.keep[:alert] = "Error creating post. Please try again."
      redirect_to new_post_path
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:image, :caption)
  end
end
