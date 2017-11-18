class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = 'Your post has been created.'
      redirect_to @post
    else
      flash[:alert] = 'Image is required to post!'
      render 'new'
    end
  end

  def show
    p Post.all()
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.permit(:text, :image)
  end
end
