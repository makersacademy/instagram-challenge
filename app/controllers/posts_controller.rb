class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params["id"])
  end

  def new

  end

  def create
    post_params = params["post"].permit("title", "contents")
    post = Post.create(post_params)
    redirect_to(post_path(post))
  end

end
