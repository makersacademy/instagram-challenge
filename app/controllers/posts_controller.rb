class PostsController < ApplicationController
  #TODO show separate images with comments
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    current_user.posts.create(post_params)
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :image)
  end

end
