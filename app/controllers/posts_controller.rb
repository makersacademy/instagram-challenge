class PostsController < ApplicationController

  def index
    @post = Post.new
  end
end
