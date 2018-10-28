class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    puts params
    @post = Post.create(messages: params[:post][:messages], user_id: current_user.id)
    redirect_to posts_url
  end

  def show
  end

  def index
    @posts = Post.all
  end
end
