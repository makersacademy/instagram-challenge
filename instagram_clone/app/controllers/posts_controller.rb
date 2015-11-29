class PostsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(posts_params)
    if @post.save
      flash[:success] = 'Suucessfully posted into Instagram'
      redirect_to post_path(@post)
    else
      flash[:error] = @post.errors.full_messages
      redirect_to 'new'
    end
  end

  def posts_params
    params.require(:post).permit(:description, :image)
  end

end
