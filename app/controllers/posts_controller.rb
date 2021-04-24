class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(params.permit(:description, :user_id))

    redirect_to root_url
  end

end
