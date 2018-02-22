class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:success] = 'Your post has been created.'
      redirect_to @post
    else
      flash[:alert] = 'Why would you not attach a picture?'
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = 'Post updated'
      redirect_to posts_path
    else
      flash[:alert] = 'Something is wrong with your form!'
      render :edit
    end
  end

private
  def post_params
    params.require(:post).permit(:description, :image)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
