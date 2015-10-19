class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @posts = Post.all

  end

  def new
    @post=Post.new

  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.save ? redirect_to(posts_path) : render('new')
  end

  def post_params
    params.require(:post).permit(:image, :caption)
  end

end
