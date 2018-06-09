class PostsController < ApplicationController
  def index

  end

  def new
    @post = Post.new
  end
end
