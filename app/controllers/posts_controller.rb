class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :owned_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.build
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Your post has been created!"
      redirect_to post_path(@post)
    else
      flash.now[:alert] = "Your new post couldn't be created!  Please check the form."
      redirect_to new_post_path
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "Your post has been updated!"
      redirect_to @post
    else
      flash.now[:alert] = "Update failed.  Please check the form."
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
    def post_params
      params.require(:post).permit(:image, :caption)
    end

    def owned_post
      unless current_user == @post.user
        flash[:alert] = "You don't have authority to edit or delete."
        redirect_to root_path
      end
    end
end
