class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  # signed out user can see index of posts, and individual posts

  def index
    @posts = Post.all
  end 

  def new
    @post = Post.new

  end 

  def create 
  #  dont want a if statement here, is there a validate before_action in controller?
    if params[:image]
      @post = Post.new(post_from_params)
      @post.user_id = current_user.id
      if @post.save
        flash[:alert] = 'image uploaded'
      redirect_to root_path
      else 
        render :new, error: "Image wasn't posted"
      end 
    else 
      flash[:alert]= "No image file selected for upload"
      redirect_to new_post_path
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
