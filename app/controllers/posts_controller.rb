class PostsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def new
    @post = Post.new
  end

  def index
    if user_signed_in?
      @current_user_id = current_user.id
    end
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @current_user = current_user
    @post = @current_user.posts.create(post_params)
    # @post = Post.new(post_params)
    if @post.save
      redirect_to root_url(@post)
    else
      redirect_to new_post_path
    end
  end

  def post_params
    params.require(:post).permit(:description, :image)
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
