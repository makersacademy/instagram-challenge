class PostsController < ApplicationController

  before_action :authenticate_user!, :except => [:index]
  before_action :check_post_belongs_to_current_user, :only => [:edit, :update, :destroy]

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

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def permitted_posts_params
    params.require(:post).permit(:description, :image)
  end

  def check_post_belongs_to_current_user
    @post = Post.find(params[:id])
    if @post.user.id != current_user.id
      flash[:notice] = "Only creator can delete post"
      redirect_to root_path
    end
  end

end
