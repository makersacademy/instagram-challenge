class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create!(content: params[:post][:content], user_id: session[:user_id], image: params[:post][:image])
    redirect_to '/posts'
  end

end
