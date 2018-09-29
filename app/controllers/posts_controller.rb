class PostsController < ApplicationController
  
  def index
    @posts = Post.all
  end

  def new
    @posts = Post.new
  end
end
