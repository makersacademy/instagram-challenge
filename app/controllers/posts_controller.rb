class PostsController < ApplicationController
  include PostsHelper

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to "/posts"
    else
      render "new"
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
    redirect_to "/posts/#{params[:id]}"
  end

  private

  def post_params
    params.require(:post).permit(:description, :location, :image)
  end

end
