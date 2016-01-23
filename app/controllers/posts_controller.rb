class PostsController < ApplicationController
  def index
  end

  def new
    @posts = Post.new
  end
end
