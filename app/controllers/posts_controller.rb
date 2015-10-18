class PostsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @posts = Post.new
  end

  def create
    @post = Post.build_with_user(post_params, current_user)

    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end


  def post_params
    params.require(:post).permit(:description)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to '/posts'
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'Post deleted successfully'
    redirect_to '/posts'
  end


end
