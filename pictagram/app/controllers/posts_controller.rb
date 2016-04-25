class PostsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  # def create
  #   @post = Post.create(post_params)
  #   redirect_to '/posts'
  # end

  def create
     @current_user = current_user
    #  @post = @current_user.posts.create(post_params)
     @post = @current_user.posts.create(post_params)
    if @post.save
      redirect_to '/posts'
    else
      render 'new'
    end
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

  def show
  @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:comment)
  end


end
