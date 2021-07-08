class PostsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    current_user.posts.create(post_params)
    redirect_to root_path
  end

  def edit
  end

  def post_params
    params.require(:post).permit(:text, :avatar)
  end
end
