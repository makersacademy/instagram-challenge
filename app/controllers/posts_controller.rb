class PostsController < ApplicationController
  def index
  end

  def create
    @post = Post.create(post_params)
  end

  private

  def post_params
    params.require(:post).permit(:moment)
  end
end
