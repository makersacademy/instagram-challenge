class PostsController < ApplicationController

  def index
    @posts = Post.all
    @like = Like.new
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
    redirect_to '/posts'
  end

  def post_params
    params.require(:post).permit(:description, :image)
  end

  def update
    @post = Post.find(params[:id])
    @post.add_like
    flash[:notice] = 'Liked!'
    redirect_to '/posts'
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'Post deleted successfully'
    redirect_to '/posts'
  end
end