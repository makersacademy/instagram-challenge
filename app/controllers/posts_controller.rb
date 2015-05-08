class PostsController < ApplicationController
  def index
    @post = Post.all
  end
end
