class PostsController < ApplicationController
  def index 
    @post = Post.new
    @post.save
  end

end
