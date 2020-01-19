class PostsController < ApplicationController
  def index
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(params[:post])
    redirect_to posts_url
  end

  private
    def post_params
      params.require(:post).permit(:title, :text)
    end

end
