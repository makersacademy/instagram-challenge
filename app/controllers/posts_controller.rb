class PostsController < ApplicationController
  before_action :authenticate_user!
  # before_action :owned_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = current_user.posts.build
  end

  # for writing to database
  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to posts_path
    else
      p "post couldn't be created"
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to(post_path(@post))
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
      p "Nacho post"
    end
  end
end
