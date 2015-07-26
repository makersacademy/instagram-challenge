class PostsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  # def create
  #   @post = Post.create(post_params)
  #   if @post.save
  #     redirect_to '/posts'
  #   else
  #     render 'new'
  #   end
  # end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user == current_user
      @post.destroy
      flash[:notice] = 'Post deleted'
      redirect_to '/posts'
    else
      flash[:notice] = 'You are not permitted to remove this post'
      redirect_to '/'
    end
  end

  def post_params
    params.require(:post).permit(:image, :name)
  end
end
