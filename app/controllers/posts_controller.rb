class PostsController < ApplicationController

  def index
    'welcome to the gram'
  end

  def new
    @post = Post.new
  end

end
