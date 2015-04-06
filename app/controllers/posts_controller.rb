class PostsController < ApplicationController

  before_action :authenticate_user!


  def index
    @home = true
    @add_image = true
    @posts = Post.all
    @user = current_user
    @comment = Comment.select("comment").last(5)
  end

  def new
    @post = Post.new
  end

  def show
    @delete = true
    @add_comment = true
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.create(post_params)
    @post.user = current_user
    if @post.save
      redirect_to '/posts'
    else
      render 'new'
    end
  end

  def destroy
    @posts = Post.find(params[:id])
    @posts.destroy
    flash[:notice] = "Post deleted successfully"
    redirect_to '/posts'
  end

  def post_params
    params.require(:post).permit(:name, :image)
  end

end
