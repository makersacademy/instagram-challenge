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
      flash[:success] = "Post posted with a success"
      redirect_to @post
    else
      flash[:alert] = "oh no you didn\'t. needing an image as well as a caption, please"
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
