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
      flash[:success] = 'Successfully posted!'
      redirect_to @post
    else
      flash[:alert] = 'No image uploaded!'
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
    if @post.update(post_params)
      flash[:success] = 'Post Updated'
      redirect_to(post_path(@post))
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:success] = 'Post Deleted'
      redirect_to posts_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end
end
