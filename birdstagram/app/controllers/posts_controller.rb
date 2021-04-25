class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    redirect_to '/posts'
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create!(content: params[:post][:content], user_id: session[:user_id])
    redirect_to '/posts'
  end

end
