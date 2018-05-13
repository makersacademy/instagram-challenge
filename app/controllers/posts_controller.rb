class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
  end

  def edit
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def update
    @post.update(post_params) if @post.owner?(current_user)
    redirect_to posts_path
  end

  def destroy
    @post.destroy if @post.owner?(current_user)
    redirect_to posts_path
  end

  private

    def post_params
      params.require(:post).permit(:photo, :desc).merge(user_id: current_user.id)
    end

    def find_post
      @post = Post.find(params[:id])
    end

end
