class PostsController < ApplicationController

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
    Post.create(post_params)
    redirect_to('/posts')
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)

    redirect_to('/posts')
  end

  def destroy
    @post = Post.find(params[:id])
    @post.delete
    flash[:notice] = 'Post deleted'
    redirect_to('/posts')
  end

  private

  def post_params
    params.require(:post).permit(:description)
  end

end
