class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index]

  def index
    @posts = Post.all
  end

  def new

  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path
    else
      flash[:alert] = "Couldn't create post. Please ensure the form is filled correctly"
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:caption, :pic)
  end

end
