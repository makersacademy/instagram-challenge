class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    render 'index'
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create!(content: params[:post][:content], user_id: session[:user_id])
    render 'index'
  end

end
