class PostsController < ApplicationController

  def new
    @post = Post.new 
  end 
  
  def create
    @post = Post.create(post_params)
      if @post.save
      flash[:alert] = "Your post has been created."
      redirect_to @post
     else
      flash[:alert] = "You must upload a picture!"
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
