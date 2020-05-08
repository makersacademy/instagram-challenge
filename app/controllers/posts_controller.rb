class PostsController < ApplicationController
  def new
  end

  def create
    current_user.posts.create(post_params)
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:image, :filter)
  end
end
