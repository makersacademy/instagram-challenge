class PostsController < ApplicationController
  include PostsHelper

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all
    @user = current_user
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    redirect_to posts_path
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    if @post.user_id === current_user.id
      @post.destroy
    else
      flash.alert = 'Unauthorised'
    end
    redirect_to posts_path
  end
end
