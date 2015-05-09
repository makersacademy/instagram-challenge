class PostsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  def index
    @posts = Post.all
  end

  def new
  end

  def create
    Post.create(post_params)
    redirect_to '/posts'
  end

  def post_params
    params.require(:post).permit(:content)
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to '/posts'
  end

end
