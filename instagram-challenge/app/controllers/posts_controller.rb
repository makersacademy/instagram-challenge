class PostsController < ApplicationController

  before_action :authenticate_user!, :except => [:index]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.build_with_user(permitted_posts_params, current_user)
    if @post.save
      redirect_to posts_path
    else
      flash[:alert] = "There has been a problem. Please try again"
      render 'new'
    end
  end

  private

  def permitted_posts_params
    params.require(:post).permit(:description, :image)
  end

end
