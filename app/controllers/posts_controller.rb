class PostsController < ApplicationController
before_action :authenticate_user!, :except => [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
    redirect_to '/posts'
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    if current_user.id != @post.user_id
      flash[:notice] = 'Cannot edit this post'
      redirect_to '/posts'
    else
      @post = Post.find(params[:id])
    end
  end

  def update
    @post = Post.find(params[:id])
    if current_user.id != @post.user_id
      flash[:notice] = 'Cannot edit this post'
      redirect_to '/posts'
    else
      @post.update(post_params)
      redirect_to '/posts'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if current_user.id != @post.user_id
      flash[:notice] = 'Cannot edit this post'
      redirect_to '/posts'
    else
      @post.destroy
      flash[:notice] = 'Restaurant deleted successfully'
      redirect_to '/restaurants'
    end
  end


  private

  def post_params
    params.require(:post).permit(:description, :image)
  end


end
