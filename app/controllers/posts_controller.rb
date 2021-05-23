class PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.all.order('created_at DESC')
  end

  def show 
    @post = Post.find(params[:id])
  end

  def new 
    @post = Post.new
  end
  
  def create 
    @post = Post.create(post_params)
    if @post.save
      flash[:success] = "Your post has been created"
      redirect_to root_url
    else 
      flash[:alert] = "You must upload a photo with your post!"
      render :new
    end 
  end

  private

  def post_params
    params.require(:post).permit(:caption, :picture)
  end
end
