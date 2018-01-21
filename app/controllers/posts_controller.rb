class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    render plain: params[:post].inspect
  end

end
