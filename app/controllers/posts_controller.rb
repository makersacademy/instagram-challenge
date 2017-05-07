class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    if current_user
      @user = current_user
      @post = Post.new
    else
      redirect_to new_user_registration_path
    end
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

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Post deleted successfully"
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:image, :caption)
  end
end
