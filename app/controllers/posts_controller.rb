class PostsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    if user_signed_in?
      @posts = Post.all
    else
      redirect_to new_user_session_path
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save ? (redirect_to '/posts') : (render 'new')
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Post '#{@post.title}' deleted"
    redirect_to '/posts'
  end

  def post_params
    params.require(:post).permit(:title, :image)
  end
end
