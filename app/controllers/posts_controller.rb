class PostsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @posts = Post.new
  end

  def create
    @posts = Post.new(post_params)
    @posts.user = current_user
    if @posts.save
      redirect_to '/posts'
    else
      render 'new'
    end
  end

  def show
    @posts = Post.find(params[:id])
  end

  def edit
    @posts = Post.find(params[:id])
    if @posts.id == current_user.id
      render 'edit'
    else
      flash[:notice] = 'You cant edit other users posts'
      redirect_to posts_path
    end
  end

  def destroy
    @posts = Post.find(params[:id])
    if @posts.user_id == current_user.id
      @posts.destroy
      flash[:notice] = 'Post deleted successfully'
      redirect_to '/posts'
    else
      flash[:notice] = 'You cant delete other users posts'
      redirect_to posts_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:description, :image)
  end

end
