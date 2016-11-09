class PostsController < ApplicationController
  #TODO show separate images with comments
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:notice] = 'Post successfully created'
    else
      flash[:alert] = 'You must upload an image to create a post'
    end
    redirect_to new_post_path
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy_if_created_by?(current_user)
      flash[:notice] = 'Post deleted successfully'
    else
      flash[:alert] = 'You can only delete your own posts'
    end
    redirect_to '/posts'
  end

  private

  def post_params
    params.require(:post).permit(:title, :image)
  end

end
