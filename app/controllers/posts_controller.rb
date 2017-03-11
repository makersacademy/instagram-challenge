class PostsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @posts = Post.all
    @current_user = current_user
  end

  def show
    @post = Post.find(params[:id])
    @current_user = current_user
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])
    if !users_post?(@post)
      flash[:notice] = 'error'
      redirect_to '/posts'
    else
      @post.update(post_params)
      redirect_to('/posts')
    end
  end

  def destroy
    if users_restaurant?(@restaurant)
      @restaurant.destroy
      flash[:notice] = "Restaurant deleted successfully"
      redirect_to '/restaurants'
    else
      flash[:notice] = "error"
      redirect_to '/restaurants'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if users_post?(@post)
      @post.destroy
      flash[:notice] = 'Post deleted'
      redirect_to('/posts')
    else
      flash[:notice] = "error"
      redirect_to '/posts'
    end
  end

  private

  def post_params
    params.require(:post).permit(:image, :description)
  end

  def users_post?(post)
    post.user_id == current_user.id
  end

end
