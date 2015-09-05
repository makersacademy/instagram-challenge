class PostsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if !@post.save
      flash[:notice] = "You must select a photo"
    end
    redirect_to "/posts"
  end

  def post_params
    params.require(:post).permit(:title, :image)
  end

end
