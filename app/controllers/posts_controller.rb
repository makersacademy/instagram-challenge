class PostsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
    unless @post.created_by?(current_user)
      flash[:notice] = 'You can only edit posts you have created'
      redirect_to posts_path
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.update_as_user(post_params, current_user)
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:id])
    unless @post.destroy_as_user(current_user)
      flash[:notice] = 'You can only delete posts you have created'
    else
      flash[:notice] = 'Post deleted successfully'
    end
    redirect_to posts_path
  end

  def post_params
    params.require(:post).permit(:image, :caption)
  end
end
