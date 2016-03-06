class PostsController < ApplicationController

  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:notice] = 'Your image was uploaded!'
      redirect_to @post
    else
      flash[:notice] = 'You need to upload an image to post!'
      render 'new'
    end
  end

  def post_params
    params.require(:post).permit(:caption,:image)
  end

  def show
    @post = Post.find(params[:id])
  end


end
