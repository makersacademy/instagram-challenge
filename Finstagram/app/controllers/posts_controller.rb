class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    if @post = Post.create(post_params)
      flash[:success] = "Your post has been created!"
      redirect_to posts_path
    else
      flash.now[:alert] = "Halt! You need an image to post here!"
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = "Post updated."
      redirect_to posts_path
    else
      flash.now[:alert] = "Sorry, update failed."
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end



  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end

  def set_post
   @post = Post.find(params[:id])
 end

end
