class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to(post_path(@post))
    flash[:success] = "Post updated"
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:success] = "Post created"
      redirect_to @post
    else
      flash[:alert] = "Ooops. You forgot to attach an image."
      render :new
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
