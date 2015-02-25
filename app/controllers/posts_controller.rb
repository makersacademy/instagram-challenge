class PostsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show, :show_pic]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.picture = post_params[:picture].read
    @post.save!
    redirect_to posts_path
  end

  def show_pic
    @post = Post.find(params[:id])
    send_data @post.picture, type: :jpg, disposition: 'inline'
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    if current_user.id != @post.user_id
      flash[:notice] = 'Error: You must be the author to edit a post'
      redirect_to posts_path
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:id])
    if current_user.id != @post.user_id
      flash[:notice] = "Error: You must be the author to delete a post"
    else
      @post.destroy
      flash[:notice] = 'Post deleted successfully'
    end
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :picture)
  end

end
