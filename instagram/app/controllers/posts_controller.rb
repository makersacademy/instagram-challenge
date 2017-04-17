class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:success] = 'Image posted'
      redirect_to '/'
    else
      flash[:alert] = 'Oops, you forgot to add a picture!'
      render :new
    end
  end

  private
  
  def post_params
    params.require(:post).permit(:caption, :image)
  end
end
