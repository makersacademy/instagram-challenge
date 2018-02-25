class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:success] = "Post created"
      redirect_to @post
    else
      flash[:alert] = "You must select a picture to post"
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

  private
  def post_params
    params.require(:post).permit(:description, :image)
  end
end
