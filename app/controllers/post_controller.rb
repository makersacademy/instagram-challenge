class PostController < ApplicationController

  def index
    @posts = Post.all
  end
end
