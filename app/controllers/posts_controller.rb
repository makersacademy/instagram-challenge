class PostsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @posts = Post.all
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.create(post_params)
    if !@post.save
      flash[:notice] = "You must select a photo"
    end
    redirect_to "/posts"
  end

  def post_params
    params.require(:post).permit(:title, :image)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Post successfully deleted!"
    redirect_to "/posts"
  end

  def show
    @post = Post.find(params[:id])
  end

end
