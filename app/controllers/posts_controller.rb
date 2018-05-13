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
      flash[:success] = "Your post has been created."
      redirect_to @post
    else
      flash[:alert] = "Please ensure an image is posted"
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
    if @post.save
      flash[:success] = "Post updated."
      redirect_to(post_path(@post))
    else
      flash[:alert] = "Please ensure an image is posted"
      render :edit
    end
  end


  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end

end
