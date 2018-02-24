class PostsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_url
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])
    if User.find(@post.user_id) == current_user
      if @post.update(post_params)
        redirect_to @post
      else
        render 'edit'
      end
    else
      flash[:notice] = "You may not edit this post"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if User.find(@post.user_id) == current_user
      @post.destroy
    else
      flash[:notice] = "You may not delete this post"
    end
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:description, :image, :image_cache)
  end

end
