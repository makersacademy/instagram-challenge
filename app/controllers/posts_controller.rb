class PostsController < ApplicationController
  
  def index
  end

  def new 
    @post = Post.new
  end

  def create 
    @post = Post.create(post_params)
    if @post.save
      flash[:success] = "Success! Post uploaded."
      redirect_to @post
    else
      flash[:alert] = "You must upload an image!"
      render :new
    end
  end

  def show 
    @post = Post.find(params[:id])
  end

  private 

  def post_params
    params.require(:post).permit(:caption, :image)
  end

end
