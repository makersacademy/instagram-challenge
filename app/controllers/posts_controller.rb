class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
  end

  def create
    Post.create(params[:post])
    redirect_to '/posts'
  end


end
