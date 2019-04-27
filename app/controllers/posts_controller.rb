class PostsController < ApplicationController

  def index
    @posts = Post.all
  end 

  def new
    @post = Post.new

  end 

  def create 
    @post = Post.new(post_from_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:sucess] = 'image uploaded'
    redirect_to root_path
    else 
      render :new, error: "Image wasn't posted"
    end 
  end


  def show
    @post = Post.find(params[:id])
  end 


  private
  def post_from_params
    params.require(:post).permit(:image)
  end 



end
