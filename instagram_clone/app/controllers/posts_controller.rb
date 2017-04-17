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
    @post.user = current_user
    if @post.save
      flash[:notice] = 'Successfully posted into Instagram'
      redirect_to post_path(@post)
    else
      flash[:notice] = @post.errors.full_messages
      redirect_to 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
    render 'edit'
  end

  def update
    @post = Post.find(params[:id])
    @post.update(posts_params)
    flash[:notice] = 'Post updated successfully'
    redirect_to '/posts'
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'Post deleted successfully'
    redirect_to '/posts'
  end

  def posts_params
    params.require(:post).permit(:description, :image)
  end

end
